#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from assignment3.srv import CreatePlan, CreatePlanResponse
from stable_baselines3 import PPO
import numpy as np

# Load the federated RL model
model = PPO.load("ppo_model_worker1")

def handle_create_plan(req):
    state = np.array(req.state).reshape(1, -1)  # Format the state correctly for the model
    action, _states = model.predict(state)
    plan = action_to_plan(action)
    plan_msg = Float32MultiArray()
    plan_msg.data = plan
    return CreatePlanResponse(plan_msg.data)

def action_to_plan(action):
    # Convert the RL model action to a plan (sequence of waypoints or actions)
    # This function will depend on how your actions are structured
    plan = []
    for a in action:
        plan.append(a)  # Placeholder
    return plan

def planner():
    rospy.init_node('planner_node')
    s = rospy.Service('create_plan', CreatePlan, handle_create_plan)
    rospy.spin()

if __name__ == '__main__':
    try:
        planner()
    except rospy.ROSInterruptException:
        pass
