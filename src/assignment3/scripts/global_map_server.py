import rospy
from discretise import process_points, generate_path
from std_msgs.msg import Bool
from gazebo_msgs.srv import GetModelState
from geometry_msgs.msg import Pose
import random

class SimpleSubscriber:
    def __init__(self):
        self.sub = rospy.Subscriber('/processing_ready', Bool, self.callback)
        self.count = 0

    def callback(self, msg):
        if msg.data:
            self.count += 1
            rospy.loginfo(f"Received true message {self.count} times.")
        if self.count == 2:
            self.execute_code()

    def execute_code(self):
        global_coords, graph, min_coords = process_points()
        
        robots = [
            'tb3_0',
            'tb3_1'
        ]
        
        # Get their current positions using gazebo get model state service
        get_model_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        
        robot_positions = {}
        for robot in robots:
            response = get_model_state(robot, 'world')
            pose = response.pose
            robot_positions[robot] = (pose.position.x, pose.position.y)
            
        # for each robot pick a point to go to from global coordinates
        for robot, position in robot_positions.items():
            start = position
            end = global_coords[random.randint(0, len(global_coords) - 1)]
            print(f"Robot {robot} going from {start} to {end}")
            path = generate_path(start, end, graph, min_coords)
            rospy.loginfo(f"Robot {robot} path: {path}")

if __name__ == '__main__':
    rospy.init_node('path_finder', anonymous=True)
    SimpleSubscriber()
    rospy.spin()
