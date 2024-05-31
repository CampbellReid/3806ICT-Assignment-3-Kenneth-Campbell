import rospy
from discretise import process_points, find_path_in_real_world
from std_msgs.msg import Bool

class SimpleSubscriber:
    def __init__(self):
        self.sub = rospy.Subscriber('processing_ready', Bool, self.callback)
        self.count = 0

    def callback(self, msg):
        if msg.data:
            self.count += 1
            rospy.loginfo(f"Received true message {self.count} times.")
        if self.count == 2:
            self.execute_code()

    def execute_code(self):
        rubbish = process_points()

if __name__ == '__main__':
    rospy.init_node('simple_subscriber_node', anonymous=True)
    SimpleSubscriber()
    rospy.spin()
