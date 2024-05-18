#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
from assignment3.srv import CreatePlan, CreatePlanResponse
from stable_baselines3 import PPO
import numpy as np

# Load the RL model
model = PPO.load("ppo_model_worker1")

def handle_create_plan(req):
    state = np.array(req.state).reshape(1, -1)  # Format the state correctly for the model
    plan = []

    max_steps = 50  # Maximum number of steps to prevent infinite loops
    for _ in range(max_steps):
        action, _states = model.predict(state)
        plan.append(action_to_step(action))
        state = step_environment(state, action)

        # Check if the goal is reached
        if is_goal_reached(state):
            break

    plan_msg = Float32MultiArray()
    plan_msg.data = [item for sublist in plan for item in sublist]  # Flatten the plan list
    return CreatePlanResponse(plan_msg.data)

def action_to_step(action):
    # Convert the RL model action to a step (waypoint or action)
    # This function will depend on how your actions are structured
    # Example: [dx, dy] movement based on discrete action
    if action == 0:  # up
        step = [0, 1]
    elif action == 1:  # down
        step = [0, -1]
    elif action == 2:  # left
        step = [-1, 0]
    elif action == 3:  # right
        step = [1, 0]
    return step

def step_environment(state, action):
    # Simulate the environment step based on the action
    step = action_to_step(action)
    new_state = state + step
    return new_state

def is_goal_reached(state):
    # Check if the goal is reached
    goal = np.array([4, 4])  # Example goal
    current_position = state[:2]
    return np.array_equal(current_position, goal)

def planner():
    rospy.init_node('planner_node')
    s = rospy.Service('create_plan', CreatePlan, handle_create_plan)
    rospy.spin()

if __name__ == '__main__':
    try:
        planner()
    except rospy.ROSInterruptException:
        pass
