#!/bin/bash

# Ensure necessary environment variables are set
export TURTLEBOT3_MODEL=${TURTLEBOT3_MODEL:-burger}  # Default to burger if not set
FIRST_TB3=tb3_0

# Positions and orientations for TurtleBots
FIRST_TB3_X_POS=-2.0
FIRST_TB3_Y_POS=0.0
FIRST_TB3_Z_POS=0.0
FIRST_TB3_YAW=1.57

rosparam set /$FIRST_TB3/robot_description "$(xacro --inorder $(rospack find turtlebot3_description)/urdf/turtlebot3_${TURTLEBOT3_MODEL}.urdf.xacro)"
rosrun gazebo_ros spawn_model -urdf -model $FIRST_TB3 -x $FIRST_TB3_X_POS -y $FIRST_TB3_Y_POS -z $FIRST_TB3_Z_POS -Y $FIRST_TB3_YAW -param robot_description
rosrun robot_state_publisher robot_state_publisher _publish_frequency:=50.0 _tf_prefix:=$FIRST_TB3 __ns:=/$FIRST_TB3

SECOND_TB3_X_POS=2.0
SECOND_TB3_Y_POS=0.0
SECOND_TB3_Z_POS=0.0
SECOND_TB3_YAW=1.57

# Function to launch the first TurtleBot
launch_first_tb3() {
  echo "Launching first TurtleBot ($FIRST_TB3)..."
  rosparam set /$FIRST_TB3/robot_description "$(xacro --inorder $(rospack find turtlebot3_description)/urdf/turtlebot3_${TURTLEBOT3_MODEL}.urdf.xacro)"
  rosrun gazebo_ros spawn_model -urdf -model $FIRST_TB3 -x $FIRST_TB3_X_POS -y $FIRST_TB3_Y_POS -z $FIRST_TB3_Z_POS -Y $FIRST_TB3_YAW -param robot_description &
  rosrun robot_state_publisher robot_state_publisher _publish_frequency:=50.0 _tf_prefix:=$FIRST_TB3 __ns:=/$FIRST_TB3 &
  rosrun assignment3 exploration_node.py __ns:=/$FIRST_TB3 _namespace:=$FIRST_TB3 &
}

# Function to launch the second TurtleBot
launch_second_tb3() {
  echo "Launching second TurtleBot ($SECOND_TB3)..."
  rosparam set /$SECOND_TB3/robot_description "$(xacro --inorder $(rospack find turtlebot3_description)/urdf/turtlebot3_${TURTLEBOT3_MODEL}.urdf.xacro)"
  rosrun gazebo_ros spawn_model -urdf -model $SECOND_TB3 -x $SECOND_TB3_X_POS -y $SECOND_TB3_Y_POS -z $SECOND_TB3_Z_POS -Y $SECOND_TB3_YAW -param robot_description &
  rosrun robot_state_publisher robot_state_publisher _publish_frequency:=50.0 _tf_prefix:=$SECOND_TB3 __ns:=/$SECOND_TB3 &
#  rosrun assignment3 exploration_node.py __ns:=/tb3_1 _namespace:=tb3_1 &
}

# Function to launch the central aggregator node
launch_aggregator() {
  echo "Launching central aggregator node..."
  rosrun assignment3 model_aggregator.py _first_namespace:=$FIRST_TB3 _second_namespace:=$SECOND_TB3 &
}

# Function to check parameters
check_parameters() {
  echo "Checking parameters..."
  rosparam get /$FIRST_TB3/robot_description
  rosparam get /$SECOND_TB3/robot_description
}

# Function to verify running nodes
verify_nodes() {
  echo "Verifying running nodes..."
  rosnode list
}

# Function to view logs
view_logs() {
  echo "Viewing logs..."
  roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch &
  rosrun rqt_console rqt_console &
}

# Launching all components
launch_all() {
  launch_first_tb3
  launch_second_tb3
  launch_aggregator
  check_parameters
  verify_nodes
  view_logs
}

# Launch all components
launch_all

# Prevent script from exiting immediately
wait
