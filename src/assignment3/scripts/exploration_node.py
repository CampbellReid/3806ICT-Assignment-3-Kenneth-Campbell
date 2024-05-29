import rospy
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Float32MultiArray
from stable_baselines3 import PPO
import numpy as np
import sys
from geometry_msgs.msg import Twist
from gazebo_msgs.srv import DeleteModel
from assignment3.msg import SerialisedDict
import os

path_to_add = os.getenv('ASSIGNMENT_FOLDER_PARENT') + '/3806ICT-Assignment-3-Kenneth-Campbell/src/assignment3/scripts'

if path_to_add not in sys.path:
    sys.path.insert(0, path_to_add)

from turtlebot_env import TurtleBotEnv
import serialiser

directml_enabled = os.getenv('DIRECTML_ENABLED')

if directml_enabled == 'true':
    import torch_directml
    print('DIRECTML_ENABLED is set to true')
else:
    print('DIRECTML_ENABLED is set to false or not set')

def print_dict_structure(d, indent=0):
    """
    Prints the structure of a dictionary. For each value, if it's a dictionary, recursively print its structure;
    otherwise, print its type.

    :param d: The dictionary to print the structure of
    :param indent: The current indentation level (used for nested dictionaries)
    """
    # Check if the input is a dictionary
    if isinstance(d, dict):
        # Iterate through all key-value pairs in the dictionary
        for key, value in d.items():
            # Print the key with the appropriate indentation
            print(' ' * indent + str(key) + ': ', end='')
            # If the value is another dictionary, recursively call the function
            if isinstance(value, dict):
                print()
                print_dict_structure(value, indent + 4)
            else:
                # Otherwise, print the type of the value
                print(type(value).__name__)
    else:
        # If the input is not a dictionary, print its type
        print(type(d).__name__)

class ExplorationNode:
    def __init__(self):
        rospy.init_node('exploration_node', anonymous=True)
        rospy.loginfo("Initializing exploration_node")

        self.namespace = rospy.get_param('~namespace')
        rospy.loginfo(f"Namespace set to: {self.namespace}")

        self.env = TurtleBotEnv(self.namespace)
        
        if directml_enabled == 'true':
            dml = torch_directml.device()
            self.model = PPO('MlpPolicy', self.env, verbose=1, device=dml)
        else:
            self.model = PPO('MlpPolicy', self.env, verbose=1)
        
        print_dict_structure(dict(self.model.get_parameters()))
        
        rospy.loginfo("TurtleBot environment and PPO model initialized")

        self.lidar_data = np.zeros(360)

        self.lidar_sub = rospy.Subscriber(f'/{self.namespace}/scan', LaserScan, self.lidar_callback)
        self.policy_pub = rospy.Publisher(f'/{self.namespace}/local_policy_update', SerialisedDict, queue_size=10)
        self.global_policy_sub = rospy.Subscriber('/global_policy_update', SerialisedDict, self.global_policy_callback)
        self.velocity_pub = rospy.Publisher(f'/{self.namespace}/cmd_vel', Twist, queue_size=10)

        rospy.on_shutdown(self.cleanup)
        rospy.loginfo("Subscribers and publishers initialized")

    def global_policy_callback(self, data):
        rospy.loginfo("Received global policy update")
        
        global_params = serialiser.policy_bytes_to_dict(data)
        local_params = self.model.get_parameters()
        local_params['policy'] = global_params
        self.model.set_parameters(local_params)
        
        rospy.loginfo(f"[{self.namespace}] Updated local model with global policy")

    def lidar_callback(self, data):
        rospy.loginfo("Lidar callback triggered")
        angle_min = data.angle_min
        angle_max = data.angle_max
        angle_increment = data.angle_increment
        ranges = np.array(data.ranges)

        # Replace all infinities with -1
        ranges[np.isinf(ranges)] = -1

        # if not np.any(np.isfinite(ranges)):
        #     rospy.logwarn(f"[{self.namespace}] No valid lidar data received")
        #     return

        self.lidar_data = ranges

        # valid_indices = np.isfinite(ranges)
        # self.lidar_data = np.zeros(360)
        # valid_ranges = ranges[valid_indices]
        # valid_angles = angle_min + np.arange(len(valid_ranges)) * angle_increment
        
        # self.lidar_data[:len(valid_ranges)] = valid_ranges

        rospy.loginfo(f"[{self.namespace}] Lidar data processed")
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

            self.policy_pub.publish(serialiser.dict_to_policy_bytes(dict(self.model.get_parameters())['policy']))
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
