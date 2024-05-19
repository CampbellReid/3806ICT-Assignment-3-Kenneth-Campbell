import torch as th
from stable_baselines3 import PPO
from stable_baselines3.common.vec_env import DummyVecEnv
import gymnasium as gym
import numpy as np

# Define the GridWorld environment interface
class GridWorldEnv(gym.Env):
    def __init__(self):
        super(GridWorldEnv, self).__init__()
        self.grid_size = 5
        self.goal = np.array([4, 4])
        self.obstacles = [np.array([2, 2]), np.array([3, 3])]
        self.observation_space = gym.spaces.Box(low=0, high=self.grid_size-1, shape=(2,), dtype=np.int32)
        self.action_space = gym.spaces.Discrete(4)  # up, down, left, right
        self.state = None

    def reset(self, seed=None, options=None):
        super().reset(seed=seed)  # Set the seed for reproducibility
        self.state = np.array([0, 0])  # Start at the top-left corner
        return self.state

    def step(self, action):
        next_state = self.state.copy()
        if action == 0:  # up
            next_state[1] = max(next_state[1] - 1, 0)
        elif action == 1:  # down
            next_state[1] = min(next_state[1] + 1, self.grid_size - 1)
        elif action == 2:  # left
            next_state[0] = max(next_state[0] - 1, 0)
        elif action == 3:  # right
            next_state[0] = min(next_state[0] + 1, self.grid_size - 1)

        reward = compute_reward(self.state, action, next_state)
        done = self.is_done(next_state)
        self.state = next_state
        truncated = False  # Set truncated to False as we are not using this in this simple environment
        info = {}
        return next_state, reward, done, truncated, info

    def is_done(self, state):
        return np.array_equal(state, self.goal)

# Define the reward function
def compute_reward(state, action, next_state):
    goal = np.array([4, 4])
    current_position = np.array(state)
    next_position = np.array(next_state)

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

# Create environments for each worker
env1 = DummyVecEnv([lambda: GridWorldEnv()])
env2 = DummyVecEnv([lambda: GridWorldEnv()])

# Create PPO models for each worker
model1 = PPO('MlpPolicy', env1, verbose=1)
model2 = PPO('MlpPolicy', env2, verbose=1)

# Function to federate learning
def federated_learning(models, rounds=10):
    for round in range(rounds):
        # Train each model locally
        for model in models:
            model.learn(total_timesteps=1000)

        # Aggregate weights
        global_weights = average_weights([model.policy.state_dict() for model in models])

        # Update each model with global weights
        for model in models:
            model.policy.load_state_dict(global_weights)

# Function to average model weights
def average_weights(weights):
    avg_weights = {}
    for key in weights[0].keys():
        avg_weights[key] = sum(weight[key] for weight in weights) / len(weights)
    return avg_weights

# Perform federated learning
federated_learning([model1, model2])

# Save the models
model1.save("ppo_model_worker1")
model2.save("ppo_model_worker2")

print('Federated learning completed')
