import torch as th
from stable_baselines3 import PPO
from stable_baselines3.common.vec_env import DummyVecEnv
import gymnasium as gym
import numpy as np

# Define the GridWorld environment interface
class GridWorldEnv(gym.Env):
    def __init__(self):
        super(GridWorldEnv, self).__init__()
        self.grid_size = 20
        self.goal = np.random.randint(0, self.grid_size, size=2)
        self.obstacles = [np.random.randint(0, self.grid_size, size=2) for _ in range(10)]
        self.observation_space = gym.spaces.Box(low=0, high=self.grid_size-1, shape=(2,), dtype=np.int32)
        self.action_space = gym.spaces.Discrete(4)  # up, down, left, right
        self.state = None

    def reset(self, seed=None, options=None):
        super().reset(seed=seed)  # Set the seed for reproducibility
        self.state = np.array([self.grid_size // 2, self.grid_size // 2])
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

        reward = compute_reward(self, self.state, action, next_state)
        done = self.is_done(next_state)
        self.state = next_state
        truncated = False  # Set truncated to False as we are not using this in this simple environment
        info = {}
        return next_state, reward, done, truncated, info

    def is_done(self, state):
        return np.array_equal(state, self.goal)

# Define the reward function
def compute_reward(env, state, action, next_state):
    goal = env.goal
    current_position = np.array(state)
    next_position = np.array(next_state)

    # Negative reward for distance to goal
    distance_to_goal = np.linalg.norm(next_position - goal)
    reward = -distance_to_goal

    # Add a positive reward for reaching the goal
    if np.array_equal(next_position, goal):
        reward += 100

    # Penalize hitting obstacles
    if any(np.array_equal(next_position, obs) for obs in env.obstacles):
        reward -= 100

    return reward

# Create environments for each worker
env1 = DummyVecEnv([lambda: GridWorldEnv()])
env2 = DummyVecEnv([lambda: GridWorldEnv()])

# Create PPO models for each worker
model1 = PPO('MlpPolicy', env1, verbose=1)
model2 = PPO('MlpPolicy', env2, verbose=1)

# Function to federate learning with adjustable rounds
def federated_learning(models, rounds=10, patience=5, min_improvement=1e-3):
    # best_reward = -np.inf
    # patience_counter = 0
    
    for round in range(rounds):
        # Train each model locally
        for model in models:
            model.learn(total_timesteps=1000)
        
        # Aggregate weights
        global_weights = average_weights([model.policy.state_dict() for model in models])
        
        # Update each model with global weights
        for model in models:
            model.policy.load_state_dict(global_weights)
        
        # Evaluate the models to check improvement
        # current_reward = np.mean([evaluate_model(model) for model in models])
        # print(f'Round {round+1}, Average Reward: {current_reward}')
        
        # Early stopping based on improvement
        # if current_reward > best_reward + min_improvement:
        #     best_reward = current_reward
        #     patience_counter = 0
        # else:
        #     patience_counter += 1
        #     if patience_counter >= patience:
        #         print(f'Early stopping at round {round+1}')
        #         break

# Function to evaluate the model
def evaluate_model(model, num_episodes=10):
    rewards = []
    for _ in range(num_episodes):
        obs = model.get_env().reset()
        done = False
        episode_reward = 0
        while not done:
            action, _states = model.predict(obs)
            obs, reward, done, _info = model.get_env().step(action)
            episode_reward += reward
        rewards.append(episode_reward)
    return np.mean(rewards)

# Function to average model weights
def average_weights(weights):
    avg_weights = {}
    for key in weights[0].keys():
        avg_weights[key] = sum(weight[key] for weight in weights) / len(weights)
    return avg_weights

# Perform federated learning with monitoring
federated_learning([model1, model2], rounds=200)

# Save the models
model1.save("ppo_model_worker1")
model2.save("ppo_model_worker2")

print('Federated learning completed')
