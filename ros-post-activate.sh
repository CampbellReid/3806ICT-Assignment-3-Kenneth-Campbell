#!/bin/bash

# Source ROS Noetic setup
source /opt/ros/noetic/setup.bash

export ASSIGNMENT_FOLDER_PARENT="/home/campbell/repos"

# Source the workspace setup
source "${ASSIGNMENT_FOLDER_PARENT}/3806ICT-Assignment-3-Kenneth-Campbell/devel/setup.bash"

# Set TURTLEBOT3 model
export TURTLEBOT3_MODEL=burger

# Update PYTHONPATH to include local site-packages and conda environment
export PYTHONPATH="${HOME}/miniconda3/envs/ros_noetic/lib/python3.8/site-packages:$PYTHONPATH"

# Update PATH to include conda environment
export PATH="${HOME}/miniconda3/envs/ros_noetic/bin:$PATH"