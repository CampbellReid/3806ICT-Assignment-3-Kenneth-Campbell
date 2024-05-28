#!/home/campbell/miniconda3/envs/ros_noetic/bin python

import rospy
from std_msgs.msg import Float32MultiArray
import numpy as np
import json
import base64
from collections import OrderedDict
from assignment3.msg import SerialisedDict

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

    def deserialise_ordered_dict(self, serialized_str):
        deserialized_dict = json.loads(serialized_str, object_pairs_hook=OrderedDict)
        for key in deserialized_dict:
            deserialized_dict[key] = np.frombuffer(base64.b64decode(deserialized_dict[key]), dtype=np.int)
        return deserialized_dict

    def policy_callback(self, data):
        local_policy = self.deserialise_ordered_dict(data.json_data)
        self.local_policies.append(local_policy)
        rospy.loginfo(f"Received local policy update: {local_policy}")
        self.aggregate_policies()

    def average_ordered_dicts(self, dict1, dict2):
        # Initialize the result OrderedDict
        averaged_dict = OrderedDict()

        # Iterate through the keys of the OrderedDicts
        for key in dict1:
            # Ensure both dictionaries have the same structure
            if key in dict2:
                # Compute the average of the corresponding ndarrays
                averaged_array = (dict1[key] + dict2[key]) / 2.0
                # Add the averaged array to the new OrderedDict
                averaged_dict[key] = averaged_array
            else:
                raise KeyError(f"Key '{key}' not found in both OrderedDicts")

        return averaged_dict

    def serialize_ordered_dict(self, ordered_dict):
        serialized_dict = OrderedDict()
        for key, array in ordered_dict.items():
            serialized_dict[key] = base64.b64encode(array.tobytes()).decode('utf-8')
        return json.dumps(serialized_dict)

    def aggregate_policies(self):
        if len(self.local_policies) == 2:
            global_policy = self.average_ordered_dicts(self.local_policies[0], self.local_policies[1])
            rospy.loginfo(f"Aggregated global policy: {global_policy}")
            self.global_policy_pub.publish(global_policy_msg)
            rospy.loginfo("Published global policy update")
            self.local_policies = []

if __name__ == '__main__':
    try:
        aggregator_node = ModelAggregatorNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
