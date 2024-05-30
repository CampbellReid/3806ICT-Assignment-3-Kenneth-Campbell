#!/usr/bin/env python

import rospy
from assessment_3.srv import get_paths
from geometry_msgs.msg import Pose
from geometry_msgs.msg import PoseArray

def callback(request):

    example_path = [(1, 0), (1, 1), (0, 1), (0, 0)]  # Use FRL found paths
    path_steps = PoseArray()
    for step in example_path:
        s = Pose()
        s.position.x = step[0]
        s.position.y = step[1]
        path_steps.poses.append(s)
    return path_steps


def path_planner():
    rospy.init_node('path_planner', anonymous = True)
    service = rospy.Service('paths_service', get_paths, callback)
    rospy.spin()


if __name__ == '__main__':
     try:
         path_planner()
     except rospy.ROSInterruptException:
         pass
