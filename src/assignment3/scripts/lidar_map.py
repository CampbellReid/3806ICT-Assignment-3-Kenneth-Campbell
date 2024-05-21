#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from tf.transformations import euler_from_quaternion

# Global variables to store the latest data
latest_ranges = []
latest_angles = []
range_max = 3.5

# Robot's current pose
robot_x = 0.0
robot_y = 0.0
robot_yaw = 0.0

# Global map
global_map = []

def lidar_callback(data):
    global latest_ranges, latest_angles, range_max

    angle_min = data.angle_min
    angle_max = data.angle_max
    angle_increment = data.angle_increment
    ranges = np.array(data.ranges)
    range_max = data.range_max

    num_points = len(ranges)
    angles = angle_min + np.arange(num_points) * angle_increment

    valid_indices = np.isfinite(ranges)
    latest_ranges = ranges[valid_indices]
    latest_angles = angles[valid_indices]

def odom_callback(data):
    global robot_x, robot_y, robot_yaw

    robot_x = data.pose.pose.position.x
    robot_y = data.pose.pose.position.y
    
    orientation_q = data.pose.pose.orientation
    orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
    (roll, pitch, yaw) = euler_from_quaternion(orientation_list)
    robot_yaw = yaw

def update_map():
    global global_map, latest_ranges, latest_angles

    if len(latest_ranges) == 0:
        rospy.logwarn("No LiDAR data received")
        return

    x_coords = latest_ranges * np.cos(latest_angles + robot_yaw) + robot_x
    y_coords = latest_ranges * np.sin(latest_angles + robot_yaw) + robot_y

    for i in range(len(x_coords)):
        global_map.append((x_coords[i], y_coords[i]))

def animate(i):
    update_map()

    if len(global_map) == 0:
        return

    x_coords, y_coords = zip(*global_map)

    ax.clear()
    ax.plot(x_coords, y_coords, 'b.', markersize=2)
    # Zoom in by setting tighter x and y limits
    zoom_factor = 5  # Change this value to zoom in/out
    ax.set_xlim(robot_x - zoom_factor, robot_x + zoom_factor)
    ax.set_ylim(robot_y - zoom_factor, robot_y + zoom_factor)
    ax.set_xlabel('X [m]')
    ax.set_ylabel('Y [m]')
    ax.set_title('2D LiDAR Map')
    ax.grid(True)

def lidar_listener():
    # Check if ROS node is already initialized
    if not rospy.core.is_initialized():
        rospy.init_node('lidar_listener', anonymous=True)
    
    rospy.Subscriber('/scan', LaserScan, lidar_callback)
    rospy.Subscriber('/odom', Odometry, odom_callback)
    ani = animation.FuncAnimation(fig, animate, interval=100)
    plt.show()
    rospy.spin()

if __name__ == '__main__':
    fig, ax = plt.subplots(figsize=(10, 10))
    try:
        lidar_listener()
    except rospy.ROSInterruptException:
        pass
