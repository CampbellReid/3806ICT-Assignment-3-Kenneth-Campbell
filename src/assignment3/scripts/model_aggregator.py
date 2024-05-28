import rospy
from std_msgs.msg import Float32MultiArray
import numpy as np

class ModelAggregatorNode:
    def __init__(self):
        rospy.init_node('model_aggregator', anonymous=True)
        
        first_namespace = rospy.get_param('~first_namespace')
        second_namespace = rospy.get_param('~second_namespace')

        self.policy_subs = []
        self.policy_subs.append(rospy.Subscriber(f'/{first_namespace}/local_policy_update', Float32MultiArray, self.policy_callback))
        self.policy_subs.append(rospy.Subscriber(f'/{second_namespace}/local_policy_update', Float32MultiArray, self.policy_callback))
        # Add more subscribers as needed
        
        self.global_policy_pub = rospy.Publisher('/global_policy_update', Float32MultiArray, queue_size=10)
        
        self.local_policies = []

    def policy_callback(self, data):
        self.local_policies.append(np.array(data.data))
        self.aggregate_policies()

    def aggregate_policies(self):
        if len(self.local_policies) > 0:
            global_policy = np.mean(self.local_policies, axis=0)
            global_policy_msg = Float32MultiArray(data=global_policy)
            self.global_policy_pub.publish(global_policy_msg)
            rospy.loginfo("Published global policy update")
            self.local_policies = []

if __name__ == '__main__':
    try:
        aggregator_node = ModelAggregatorNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
