import rospy
from assignment3.srv import ProcessSensorData, ProcessSensorDataResponse

def process_sensor_data(req):
    # Process sensor data to update the agent's state
    res = ProcessSensorDataResponse()
    res.state.current_position = req.data.position
    # Update the environment map and other state information
    return res

def interpreter_server():
    rospy.init_node('interpreter_node')
    service = rospy.Service('process_sensor_data', ProcessSensorData, process_sensor_data)
    rospy.spin()

if __name__ == "__main__":
    interpreter_server()
