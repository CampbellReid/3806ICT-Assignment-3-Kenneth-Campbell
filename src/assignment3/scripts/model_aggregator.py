#!/home/campbell/miniconda3/envs/ros_noetic/bin python

import rospy
from std_msgs.msg import Float32MultiArray
import numpy as np
from assignment3.msg import SerialisedDict
from collections import OrderedDict
import sys
import os

path_to_add = os.getenv('ASSIGNMENT_FOLDER_PARENT') + '/3806ICT-Assignment-3-Kenneth-Campbell/src/assignment3/scripts'

if path_to_add not in sys.path:
    sys.path.insert(0, path_to_add)

import serialiser

import numpy as np

class ModelAggregatorNode:
    def __init__(self):
        rospy.init_node('model_aggregator', anonymous=True)
        
        first_namespace = rospy.get_param('~first_namespace')
        second_namespace = rospy.get_param('~second_namespace')

        self.policy_subs = []
        self.policy_subs.append(rospy.Subscriber(f'/{first_namespace}/local_policy_update', SerialisedDict, self.policy_callback))
        self.policy_subs.append(rospy.Subscriber(f'/{second_namespace}/local_policy_update', SerialisedDict, self.policy_callback))
        # Add more subscribers as needed
        
        self.global_policy_pub = rospy.Publisher('/global_policy_update', SerialisedDict, queue_size=10)
        
        self.local_policies = []

    def policy_callback(self, data):
        local_policy = serialiser.policy_bytes_to_dict(data)
        self.local_policies.append(local_policy)
        #rospy.loginfo(f"Received local policy update: {local_policy}")
        self.aggregate_policies()

    def aggregate_policies(self):
        if len(self.local_policies) == 2:
            global_policy = serialiser.average_policy(self.local_policies[0], self.local_policies[1])
            #rospy.loginfo(f"Aggregated global policy: {global_policy}")
            
            global_policy_msg = serialiser.dict_to_policy_bytes(global_policy)
            
            self.global_policy_pub.publish(global_policy_msg)
            #rospy.loginfo("Published global policy update")
            self.local_policies = []

if __name__ == '__main__':
    try:
        aggregator_node = ModelAggregatorNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
