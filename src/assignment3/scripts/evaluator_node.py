#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from assignment3.srv import ValidatePlan, ValidatePlanResponse

def handle_validate_plan(req):
    map_data = {'obstacles': [(2, 2), (3, 3)]}  # Example obstacle positions
    plan = [(req.plan[i], req.plan[i+1]) for i in range(0, len(req.plan), 2)]
    is_safe = all(point not in map_data['obstacles'] for point in plan)
    return ValidatePlanResponse(is_safe)

def evaluator():
    rospy.init_node('evaluator_node')
    s = rospy.Service('validate_plan', ValidatePlan, handle_validate_plan)
    rospy.spin()

if __name__ == '__main__':
    try:
        evaluator()
    except rospy.ROSInterruptException:
        pass
