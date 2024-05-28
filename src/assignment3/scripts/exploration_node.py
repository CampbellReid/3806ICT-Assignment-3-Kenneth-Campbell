#!/home/campbell/miniconda3/envs/ros_noetic/bin python

import rospy
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Float32MultiArray
from stable_baselines3 import PPO
import numpy as np
import sys
from geometry_msgs.msg import Twist
from gazebo_msgs.srv import DeleteModel
import torch_directml
from collections import OrderedDict
import base64
import json
from std_msgs.msg import Header
from assignment3.msg import SerialisedDict

path_to_add = '/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/src/assignment3/scripts'

if path_to_add not in sys.path:
    sys.path.insert(0, path_to_add)

from turtlebot_env import TurtleBotEnv

class ExplorationNode:
    def __init__(self):
        rospy.init_node('exploration_node', anonymous=True)
        rospy.loginfo("Initializing exploration_node")

        self.namespace = rospy.get_param('~namespace')
        rospy.loginfo(f"Namespace set to: {self.namespace}")

        dml = torch_directml.device()

        self.env = TurtleBotEnv(self.namespace)
        self.model = PPO('MlpPolicy', self.env, verbose=1, device=dml)
        rospy.loginfo("TurtleBot environment and PPO model initialized")

        self.lidar_data = np.zeros(360)

        self.lidar_sub = rospy.Subscriber(f'/{self.namespace}/scan', LaserScan, self.lidar_callback)
        self.policy_pub = rospy.Publisher(f'/{self.namespace}/local_policy_update', Float32MultiArray, queue_size=10)
        self.global_policy_sub = rospy.Subscriber('/global_policy_update', Float32MultiArray, self.global_policy_callback)
        self.velocity_pub = rospy.Publisher(f'/{self.namespace}/cmd_vel', Twist, queue_size=10)

        rospy.on_shutdown(self.cleanup)
        rospy.loginfo("Subscribers and publishers initialized")

    def deserialise_ordered_dict(self, serialized_str):
        deserialized_dict = json.loads(serialized_str, object_pairs_hook=OrderedDict)
        for key in deserialized_dict:
            deserialized_dict[key] = np.frombuffer(base64.b64decode(deserialized_dict[key]), dtype=np.int)
        return deserialized_dict

    def serialize_ordered_dict(self, ordered_dict):
        serialized_dict = OrderedDict()
        for key, array in ordered_dict.items():
            serialized_dict[key] = base64.b64encode(array.tobytes()).decode('utf-8')
        return json.dumps(serialized_dict)

    def global_policy_callback(self, data):
        rospy.loginfo("Received global policy update")
        
        self.set_params_from_list(self.model, data.data, self.model.get_parameters())
        rospy.loginfo(f"[{self.namespace}] Updated local model with global policy")

    def lidar_callback(self, data):
        rospy.loginfo("Lidar callback triggered")
        angle_min = data.angle_min
        angle_max = data.angle_max
        angle_increment = data.angle_increment
        ranges = np.array(data.ranges)

        if not np.any(np.isfinite(ranges)):
            rospy.logwarn(f"[{self.namespace}] No valid lidar data received")
            return

        valid_indices = np.isfinite(ranges)
        self.lidar_data = np.zeros(360)
        valid_ranges = ranges[valid_indices]
        valid_angles = angle_min + np.arange(len(valid_ranges)) * angle_increment
        
        self.lidar_data[:len(valid_ranges)] = valid_ranges

        rospy.loginfo(f"[{self.namespace}] Lidar data processed: {len(valid_ranges)} valid readings")
        self.perform_exploration()

    def perform_exploration(self):
        if len(self.lidar_data) > 0:
            rospy.loginfo(f"[{self.namespace}] Performing exploration step")
            action, _states = self.model.predict(self.lidar_data)
            rospy.loginfo(f"[{self.namespace}] Action predicted: {action}")
            try:
                state, reward, done, info = self.env.step(action)
                rospy.loginfo(f"[{self.namespace}] Step result - State: {state}, Reward: {reward}, Done: {done}, Info: {info}")
            except rospy.ROSException as e:
                rospy.logerr(f"[{self.namespace}] Step failed: {e}")
                return
            
            data = Float32MultiArray(data=self.get_params_as_list(self.model)[0])

            self.policy_pub.publish(data)
            rospy.loginfo(f"[{self.namespace}] Published local policy update")

            if done:
                rospy.loginfo(f"[{self.namespace}] Episode finished. Resetting environment")
                self.env.reset()

    def cleanup(self):
        rospy.loginfo(f"[{self.namespace}] Shutting down. Stopping the robot and cleaning up.")
        
        stop_cmd = Twist()
        stop_cmd.linear.x = 0.0
        stop_cmd.angular.z = 0.0
        self.velocity_pub.publish(stop_cmd)
        rospy.loginfo(f"[{self.namespace}] Published stop command")

        try:
            rospy.wait_for_service('/gazebo/delete_model', timeout=5)
            delete_model = rospy.ServiceProxy('/gazebo/delete_model', DeleteModel)
            response = delete_model(self.namespace)
            if response.success:
                rospy.loginfo(f"[{self.namespace}] Deleted model from Gazebo: {response.status_message}")
            else:
                rospy.logerr(f"[{self.namespace}] Failed to delete model: {response.status_message}")
        except rospy.ServiceException as e:
            rospy.logerr(f"[{self.namespace}] Service call failed: {e}")

        self.lidar_sub.unregister()
        self.policy_pub.unregister()
        self.global_policy_sub.unregister()
        self.velocity_pub.unregister()
        rospy.loginfo(f"[{self.namespace}] Cleanup complete. All topics unregistered.")

if __name__ == '__main__':
    try:
        exploration_node = ExplorationNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        rospy.logerr("ROS Interrupt Exception caught!")
        pass
