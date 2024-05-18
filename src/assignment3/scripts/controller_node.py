#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from assignment3.srv import ExecutePlan, ExecutePlanResponse
from stable_baselines3 import PPO
import numpy as np

# Load the federated RL model
model = PPO.load("ppo_model_worker1")

def handle_execute_plan(req):
    plan = req.plan
    for step in plan:
        state = np.array(step).reshape(1, -1)  # Format the state correctly for the model
        action, _states = model.predict(state)
        execute_action(action)
    return ExecutePlanResponse(True)

def execute_action(action):
    # Convert the RL model action to actual robot commands
    # This function will depend on your specific robot and action space
    rospy.loginfo("Executing action: %s", action)
    # Example: publish to a topic or send a command to the robot's controller

def controller():
    rospy.init_node('controller_node')
    s = rospy.Service('execute_plan', ExecutePlan, handle_execute_plan)
    rospy.spin()

if __name__ == '__main__':
    try:
        controller()
    except rospy.ROSInterruptException:
        pass
