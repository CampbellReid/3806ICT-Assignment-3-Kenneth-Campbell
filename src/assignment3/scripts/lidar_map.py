#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from tf.transformations import euler_from_quaternion
import tf

# Global variables to store the latest data
latest_ranges = []
latest_angles = []
range_max = 3.5
robot_x = 0.0
robot_y = 0.0
robot_yaw = 0.0

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

def update_position():
    global robot_x, robot_y, robot_yaw

    listener = tf.TransformListener()
    try:
        (trans, rot) = listener.lookupTransform('/map', '/base_link', rospy.Time(0))
        robot_x = trans[0]
        robot_y = trans[1]
        euler = euler_from_quaternion(rot)
        robot_yaw = euler[2]
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
        pass

def animate(i):
    update_position()
    if len(latest_ranges) == 0:
        return

    x_coords = latest_ranges * np.cos(latest_angles + robot_yaw) + robot_x
    y_coords = latest_ranges * np.sin(latest_angles + robot_yaw) + robot_y

    ax.clear()
    ax.plot(x_coords, y_coords, 'b.', markersize=2)
    ax.set_xlim(-range_max, range_max)
    ax.set_ylim(-range_max, range_max)
    ax.set_xlabel('X [m]')
    ax.set_ylabel('Y [m]')
    ax.set_title('2D LiDAR Map')
    ax.grid(True)

def lidar_listener():
    rospy.init_node('lidar_listener', anonymous=True)
    rospy.Subscriber('/scan', LaserScan, lidar_callback)
    ani = animation.FuncAnimation(fig, animate, interval=100)
    plt.show()
    rospy.spin()

if __name__ == '__main__':
    fig, ax = plt.subplots(figsize=(10, 10))
    try:
        lidar_listener()
    except rospy.ROSInterruptException:
        pass
