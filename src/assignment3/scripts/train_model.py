import gym
import numpy as np
from stable_baselines3 import PPO
from stable_baselines3.common.envs import DummyVecEnv
import rospy
import sys
from std_srvs.srv import Empty

# Define the Gazebo environment interface
class GazeboEnv(gym.Env):
    def __init__(self):
        super(GazeboEnv, self).__init__()
        self.observation_space = gym.spaces.Box(low=-np.inf, high=np.inf, shape=(2,), dtype=np.float32)
        self.action_space = gym.spaces.Discrete(4)  # Example: up, down, left, right

    def reset(self):
        # Reset the environment in Gazebo
        rospy.wait_for_service('/gazebo/reset_simulation')
        reset_simulation = rospy.ServiceProxy('/gazebo/reset_simulation', Empty)
        reset_simulation()
        return self.get_state()

    def step(self, action):
        # Execute the action in Gazebo
        next_state = self.execute_action(action)
        reward = compute_reward(self.state, action, next_state)
        done = self.is_done(next_state)
        self.state = next_state
        return next_state, reward, done, {}

    def get_state(self):
        # Retrieve the state from Gazebo
        state = [0.0, 0.0]  # Placeholder
        return np.array(state)

    def execute_action(self, action):
        # Send the action to Gazebo and get the next state
        next_state = self.get_state()  # Placeholder
        return next_state

    def is_done(self, state):
        # Define the termination condition
        goal = np.array([4, 4])
        current_position = np.array(state[:2])
        return np.array_equal(current_position, goal)

# Define the reward function
def compute_reward(state, action, next_state):
    goal = np.array([4, 4])
    current_position = np.array(state[:2])
    next_position = np.array(next_state[:2])

    # Negative reward for distance to goal
    distance_to_goal = np.linalg.norm(next_position - goal)
    reward = -distance_to_goal

    # Add a positive reward for reaching the goal
    if np.array_equal(next_position, goal):
        reward += 100

    # Penalize hitting obstacles
    obstacles = [np.array([2, 2]), np.array([3, 3])]
    if any(np.array_equal(next_position, obs) for obs in obstacles):
        reward -= 100

    return reward

# Initialize the ROS node
rospy.init_node('train_model')

# Create the Gazebo environment
env = DummyVecEnv([lambda: GazeboEnv()])

# Create the PPO model
model = PPO('MlpPolicy', env, verbose=1)

# Train the model
model.learn(total_timesteps=10000)

# Save the model
model.save('ppo_model')

# Shut down the ROS node
rospy.signal_shutdown('Training completed')
