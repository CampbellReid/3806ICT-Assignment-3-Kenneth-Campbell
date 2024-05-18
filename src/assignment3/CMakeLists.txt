cmake_minimum_required(VERSION 3.0.2)
project(assignment3)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  geometry_msgs
  message_generation
)

add_message_files(
  FILES
  Command.msg
  Feedback.msg
  Goal.msg
  Goals.msg
  Map.msg
  Obstacle.msg
  Plan.msg
  SensorData.msg
  State.msg
  Waypoint.msg
)

add_service_files(
  FILES
  CollectData.srv
  ProcessSensorData.srv
  ValidatePlan.srv
  CreatePlan.srv
  UpdateGoals.srv
  ExecutePlan.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

# Add executables for Python nodes
catkin_install_python(PROGRAMS
  scripts/plan_validator_node.py
  scripts/controller_node.py
  scripts/interpreter_node.py
  scripts/goal_manager_node.py
  scripts/monitor_node.py
  scripts/planner_node.py
  scripts/main.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
