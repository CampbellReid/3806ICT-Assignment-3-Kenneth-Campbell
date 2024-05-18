cmake_minimum_required(VERSION 3.0.2)
project(assignment3)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  message_generation
)

add_message_files(
  FILES
  Float32MultiArray.msg
  Bool.msg
)

add_service_files(
  FILES
  CollectData.srv
  ProcessSensorData.srv
  ValidatePlan.srv
  CreatePlan.srv
  ExecutePlan.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS
  scripts/main.py
  scripts/monitor_node.py
  scripts/interpreter_node.py
  scripts/evaluator_node.py
  scripts/planner_node.py
  scripts/controller_node.py
  scripts/train_model.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
