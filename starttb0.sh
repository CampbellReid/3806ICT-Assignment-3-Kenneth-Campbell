# Set up and run the robot state publisher for the first TurtleBot
rosparam set /tb3_0/robot_description "$(xacro $(rospack find turtlebot3_description)/urdf/turtlebot3_${TURTLEBOT3_MODEL}.urdf.xacro)"
sleep 2  # Ensure the parameter server is updated
rosrun robot_state_publisher robot_state_publisher _publish_frequency:=50.0 _tf_prefix:=tb3_0 __ns:=/tb3_0 &

# Spawn the first TurtleBot model in Gazebo
sleep 2  # Ensure the robot_description param is available
rosrun gazebo_ros spawn_model -urdf -model tb3_0 -x 0.0 -y 0.0 -z 0.0 -Y 1.57 -param robot_description -robot_namespace /tb3_0 &

# Start the first TurtleBot exploration node
rosrun assignment3 exploration_node.py _namespace:=tb3_0