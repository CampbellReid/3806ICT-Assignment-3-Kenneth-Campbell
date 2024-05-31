# Set up and run the robot state publisher for the second TurtleBot
rosparam set /tb3_1/robot_description "$(xacro --inorder $(rospack find turtlebot3_description)/urdf/turtlebot3_${TURTLEBOT3_MODEL}.urdf.xacro)"
rosrun robot_state_publisher robot_state_publisher _publish_frequency:=50.0 _tf_prefix:=tb3_1 __ns:=/tb3_1 &

# Spawn the second TurtleBot model in Gazebo
rosrun gazebo_ros spawn_model -urdf -model tb3_1 -x 1.0 -y 0.0 -z 0.0 -Y 1.57 -param robot_description -namespace /tb3_1 &

# Start the second TurtleBot exploration node
rosrun assignment3 exploration_node.py _namespace:=tb3_1