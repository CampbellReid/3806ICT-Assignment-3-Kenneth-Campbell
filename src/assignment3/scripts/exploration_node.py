import rospy
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
import numpy as np
import tf
from gazebo_msgs.srv import DeleteModel
import open3d as o3d
import time
import random

# Global variables
namespace = None
lidar_data = np.zeros(360)
position = None
orientation = None
point_cloud = o3d.geometry.PointCloud()
start_time = None
velocity_pub = None

def initialize_node():
    global namespace, velocity_pub, start_time

    rospy.init_node('exploration_node', anonymous=True)
    namespace = rospy.get_param('~namespace')

    rospy.Subscriber(f'/{namespace}/scan', LaserScan, lidar_callback)
    rospy.Subscriber(f'/{namespace}/odom', Odometry, odom_callback)
    velocity_pub = rospy.Publisher(f'/{namespace}/cmd_vel', Twist, queue_size=10)

    rospy.on_shutdown(cleanup)
    rospy.loginfo("Node initialized")

    start_time = time.time()
    move_robot()

def odom_callback(data):
    global position, orientation
    position = data.pose.pose.position
    orientation = data.pose.pose.orientation
    rospy.loginfo(f"Odometry updated: position = {position}, orientation = {orientation}")

def lidar_callback(data):
    global lidar_data, position, orientation, point_cloud
    lidar_data = np.array(data.ranges)

    angle_min = data.angle_min
    angle_increment = data.angle_increment
    angles = np.arange(angle_min, angle_min + len(lidar_data) * angle_increment, angle_increment)
    x_coords = lidar_data * np.cos(angles)
    y_coords = lidar_data * np.sin(angles)
    z_coords = np.zeros_like(x_coords)  # Assuming 2D lidar, set z to zero

    if position and orientation:
        quaternion = [orientation.x, orientation.y, orientation.z, orientation.w]
        _, _, yaw = tf.transformations.euler_from_quaternion(quaternion)

        cos_yaw = np.cos(yaw)
        sin_yaw = np.sin(yaw)

        x_global = cos_yaw * x_coords - sin_yaw * y_coords + position.x
        y_global = sin_yaw * x_coords + cos_yaw * y_coords + position.y

        global_points = np.vstack((x_global, y_global, z_coords)).T
        point_cloud.points.extend(o3d.utility.Vector3dVector(global_points))
        rospy.loginfo(f"Global points collected: {global_points}")
    else:
        rospy.logwarn("Position and orientation data not available yet")

def move_robot():
    rate = rospy.Rate(10)  # 10 Hz
    twist = Twist()

    while not rospy.is_shutdown():
        if time.time() - start_time > 240:  # Stop after 2 minutes
            break

        # Obstacle avoidance using front sensors (first 30 and last 30 degrees)
        front_distances = np.concatenate((lidar_data[:30], lidar_data[-30:]))
        min_distance = np.min(front_distances)
        if min_distance < 0.5:  # Obstacle detected within 0.5 meters
            twist.linear.x = 0.0
            twist.angular.z = -0.5  # Turn right
        else:
            twist.linear.x = 0.2  # Move forward
            # add slight randomness to the turning
            twist.angular.z = random.uniform(-0.1, 0.1)

        velocity_pub.publish(twist)
        rate.sleep()

    stop_robot()

def stop_robot():
    twist = Twist()
    twist.linear.x = 0.0
    twist.angular.z = 0.0
    velocity_pub.publish(twist)
    rospy.loginfo("Robot stopped")

def save_points_to_pcd(filename):
    o3d.io.write_point_cloud(filename, point_cloud)
    rospy.loginfo(f"Points saved to {filename}")

def cleanup():
    global namespace

    stop_robot()

    rospy.wait_for_service('/gazebo/delete_model')
    delete_model = rospy.ServiceProxy('/gazebo/delete_model', DeleteModel)
    delete_model(namespace)

    save_points_to_pcd(f'/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/{namespace}_points.pcd')

if __name__ == '__main__':
    try:
        initialize_node()
        rospy.spin()
    except rospy.ROSInterruptException:
        rospy.logerr("ROS Interrupt Exception caught!")
        pass
