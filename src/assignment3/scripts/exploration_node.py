import rospy
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Float32MultiArray
from stable_baselines3 import PPO
import numpy as np
import argparse
import sys
import os

import sys

path_to_add = '/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/src/assignment3/scripts'

if path_to_add not in sys.path:
    sys.path.insert(0, path_to_add)

from turtlebot_env import TurtleBotEnv

class ExplorationNode:
    def __init__(self, namespace):
        rospy.init_node(f'{namespace}_exploration_node', anonymous=True)
        
        self.env = TurtleBotEnv(namespace)
        self.model = PPO('MlpPolicy', self.env, verbose=1)
        
        self.lidar_data = np.zeros(360)
        self.namespace = namespace
        
        self.lidar_sub = rospy.Subscriber(f'{namespace}/scan', LaserScan, self.lidar_callback)
        self.policy_pub = rospy.Publisher(f'{namespace}/local_policy_update', Float32MultiArray, queue_size=10)
        self.global_policy_sub = rospy.Subscriber('/global_policy_update', Float32MultiArray, self.global_policy_callback)

    def global_policy_callback(self, data):
        global_policy = np.array(data.data)
        self.model.set_parameters(global_policy)
        rospy.loginfo(f"[{self.namespace}] Updated local model with global policy")

    def lidar_callback(self, data):
        angle_min = data.angle_min
        angle_max = data.angle_max
        angle_increment = data.angle_increment
        ranges = np.array(data.ranges)
        valid_indices = np.isfinite(ranges)
        self.lidar_data = ranges[valid_indices]
        angles = angle_min + np.arange(len(ranges)) * angle_increment
        self.lidar_data = ranges[valid_indices]
        self.perform_exploration()

    def perform_exploration(self):
        if len(self.lidar_data) == 360:
            action, _states = self.model.predict(self.lidar_data)
            state, reward, done, info = self.env.step(action)
            policy_update = Float32MultiArray(data=action)
            self.policy_pub.publish(policy_update)
            rospy.loginfo(f"[{self.namespace}] Published local policy update")
            if done:
                self.env.reset()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Exploration Node')
    parser.add_argument('--namespace', type=str, required=True, help='Namespace for the TurtleBot')
    args, unknown = parser.parse_known_args()  # This allows argparse to ignore unknown arguments
    
    try:
        exploration_node = ExplorationNode(args.namespace)
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
