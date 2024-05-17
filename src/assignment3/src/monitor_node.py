import rospy
from assignment3.srv import CollectData, CollectDataResponse
from assignment3.msg import SensorData

def collect_data(req):
    # Simulate sensor data collection
    data = SensorData()
    data.position.x = 1.0
    data.position.y = 2.0
    data.speed = 0.5
    # Add more sensor data as needed
    return CollectDataResponse(data)

def monitor_server():
    rospy.init_node('monitor_node')
    service = rospy.Service('collect_data', CollectData, collect_data)
    rospy.spin()

if __name__ == "__main__":
    monitor_server()
