#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from assignment3.srv import ExecutePlan, ExecutePlanResponse
import numpy as np

def handle_execute_plan(req):
    plan = [(req.plan[i], req.plan[i+1]) for i in range(0, len(req.plan), 2)]
    for step in plan:
        execute_step(step)
    return ExecutePlanResponse(True)

def execute_step(step):
    # Convert the step to actual robot commands
    # This function will depend on your specific robot and action space
    # Example: publish to a topic or send a command to the robot's controller
    rospy.loginfo("Executing step: %s", step)
    # Example: simulate sending the command to the robot
    rospy.sleep(1)  # Simulate time taken to execute the step

def controller():
    rospy.init_node('controller_node')
    s = rospy.Service('execute_plan', ExecutePlan, handle_execute_plan)
    rospy.spin()

if __name__ == '__main__':
    try:
        controller()
    except rospy.ROSInterruptException:
        pass
