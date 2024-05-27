import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import numpy as np
from tf.transformations import euler_from_quaternion
import open3d as o3d
import random
import time
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from gazebo_msgs.srv import GetModelState

# Global variables to store the latest data
ranges = []
angles = []
range_max = 3.5

# Robot's current pose
robot_x = 0.0
robot_y = 0.0
robot_yaw = 0.0

# Global map (point cloud)
global_map = o3d.geometry.PointCloud()

# File to save the map data
output_file = 'lidar_map_data.pcd'

# Parameters for obstacle avoidance and exploration
safe_distance = 0.5  # Minimum safe distance from obstacles
exploration_rate = 0.1  # Rate of exploration (higher means more aggressive)
stuck_duration_threshold = 5.0  # Duration to consider the robot stuck
stuck_counter_threshold = 30  # Number of stuck detections before changing behavior

# State machine variables
last_move_time = 0
stuck_counter = 0
exploration_mode = True

def lidar_callback(data):
    global ranges, angles, range_max

    angle_min = data.angle_min
    angle_max = data.angle_max
    angle_increment = data.angle_increment
    ranges = np.array(data.ranges)
    range_max = data.range_max

    num_points = len(ranges)
    angles = angle_min + np.arange(num_points) * angle_increment

    valid_indices = np.isfinite(ranges)
    ranges = ranges[valid_indices]
    angles = angles[valid_indices]

    angles = np.array(angles)
    ranges = np.array(ranges)

def get_robot_position():
    global robot_x, robot_y, robot_yaw

    try:
        rospy.wait_for_service('/gazebo/get_model_state', timeout=1.0)
        get_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        response = get_state(model_name='turtlebot3_burger', relative_entity_name='world')

        x = response.pose.position.x
        y = response.pose.position.y
        # Log the robot's position
        rospy.loginfo("Robot position: ({}, {})".format(x, y))
        
        orientation_q = response.pose.orientation
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        (_, _, yaw) = euler_from_quaternion(orientation_list)

        robot_x, robot_y, robot_yaw = x, y, yaw

    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s" % e)

def update_map():
    global global_map, ranges, angles, robot_x, robot_y, robot_yaw

    if len(ranges) == 0:
        rospy.logwarn("No LiDAR data received")
        return

    # Convert polar coordinates to Cartesian coordinates
    x = ranges * np.cos(angles + robot_yaw) + robot_x
    y = ranges * np.sin(angles + robot_yaw) + robot_y
    
    new_points = np.vstack((x, y, np.zeros_like(x))).T

    new_pcd = o3d.geometry.PointCloud()
    new_pcd.points = o3d.utility.Vector3dVector(new_points)
    
    global_map += new_pcd

def save_map_to_pcd(filename, map_data):
    o3d.io.write_point_cloud(filename, map_data)
    rospy.loginfo("Map data saved to {}".format(filename))

def clean_up_map(map_data, epsilon=0.1):
    map_data = map_data.voxel_down_sample(voxel_size=epsilon)
    return map_data

def normalise_angle(angles):
    return np.mod(angles, 2 * np.pi)

def is_angle_in_range(angles, start, end):
    norm_angles = normalise_angle(angles)
    norm_start = normalise_angle(np.array([start]))[0]
    norm_end = normalise_angle(np.array([end]))[0]

    if norm_start < norm_end:
        return (norm_start <= norm_angles) & (norm_angles < norm_end)
    else:
        return (norm_start <= norm_angles) | (norm_angles < norm_end)

def avoid_obstacles():
    global ranges, angles, safe_distance, last_move_time, stuck_counter, exploration_mode

    if len(angles) == 0 or len(ranges) == 0 or len(angles) != len(ranges):
        rospy.logwarn("Invalid LiDAR data")
        return Twist()

    # Determine points in the front range of the robot
    angles_in_range = is_angle_in_range(angles, -np.pi / 4, np.pi / 4)
    ranges_in_range = ranges[angles_in_range]

    twist = Twist()
    if len(ranges_in_range) == 0:
        twist.linear.x = 0.0
        twist.angular.z = 0.5  # Turn in place if no data
        return twist

    min_distance = np.min(ranges_in_range)
    if min_distance < safe_distance:
        twist.linear.x = 0.0
        twist.angular.z = 0.5  # Turn in place to avoid obstacle

        current_time = time.time()
        if current_time - last_move_time > stuck_duration_threshold:
            stuck_counter += 1
            last_move_time = current_time
        else:
            stuck_counter = 0

        if stuck_counter > stuck_counter_threshold:
            exploration_mode = not exploration_mode
            stuck_counter = 0
    else:
        twist.linear.x = 0.2  # Move forward
        twist.angular.z = random.uniform(-0.5, 0.5)  # Random slight turn for exploration
        last_move_time = time.time()
        stuck_counter = 0

    return twist

def lidar_listener():
    if not rospy.core.is_initialized():
        rospy.init_node('lidar_listener', anonymous=True)
    
    rospy.Subscriber('/scan', LaserScan, lidar_callback)

    cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
    
    rate = rospy.Rate(10)

    fig, ax = plt.subplots(figsize=(10, 10))
    sc = ax.scatter([], [], s=1)
    ax.set_xlim(range_max, -range_max)
    ax.set_ylim(-range_max, range_max)
    ax.set_xlabel('Y Coordinate')
    ax.set_ylabel('X Coordinate')
    ax.set_title('Real-Time Global Map')
    ax.grid(True)

    def update_plot(frame):
        get_robot_position()
        update_map()
        points = np.asarray(global_map.points)
        if points.size > 0:
            x = points[:, 0]
            y = points[:, 1]
            sc.set_offsets(np.c_[y, x])  # Swap x and y for plotting
            sc.set_color('black')  # Set all points to black
        twist = avoid_obstacles()
        cmd_vel_pub.publish(twist)
        return sc,

    ani = FuncAnimation(fig, update_plot, frames=range(100), interval=100, blit=True)

    plt.show()

    while not rospy.is_shutdown():
        rate.sleep()

    cleaned_map = clean_up_map(global_map)
    save_map_to_pcd(output_file, cleaned_map)

if __name__ == '__main__':
    try:
        lidar_listener()
    except rospy.ROSInterruptException:
        pass
