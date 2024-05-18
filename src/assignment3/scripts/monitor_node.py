#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from assignment3.srv import CollectData, CollectDataResponse

def handle_collect_data(req):
    sensor_data = Float32MultiArray()
    # Collect sensor data from Gazebo environment
    # Example: sensor_data.data = get_gazebo_sensor_data()
    sensor_data.data = [0.0, 0.0]  # Placeholder data
    return CollectDataResponse(sensor_data.data)

def monitor():
    rospy.init_node('monitor_node')
    s = rospy.Service('collect_data', CollectData, handle_collect_data)
    rospy.spin()

if __name__ == '__main__':
    try:
        monitor()
    except rospy.ROSInterruptException:
        pass
