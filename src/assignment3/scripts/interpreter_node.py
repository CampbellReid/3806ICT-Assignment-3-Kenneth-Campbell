#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from assignment3.srv import ProcessSensorData, ProcessSensorDataResponse

def handle_process_sensor_data(req):
    # Create a map based on sensor data
    processed_data = req.data  # Simplified processing to map
    rospy.loginfo("Processed data (map): %s", processed_data)
    return ProcessSensorDataResponse(processed_data)

def interpreter():
    rospy.init_node('interpreter_node')
    s = rospy.Service('process_sensor_data', ProcessSensorData, handle_process_sensor_data)
    rospy.spin()

if __name__ == '__main__':
    try:
        interpreter()
    except rospy.ROSInterruptException:
        pass
