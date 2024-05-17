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

add_executable(monitor_node src/monitor_node.cpp)
target_link_libraries(monitor_node ${catkin_LIBRARIES})
add_dependencies(monitor_node assignment3_generate_messages_cpp)

add_executable(interpreter_node src/interpreter_node.cpp)
target_link_libraries(interpreter_node ${catkin_LIBRARIES})
add_dependencies(interpreter_node assignment3_generate_messages_cpp)

add_executable(plan_validator_node src/plan_validator_node.cpp)
target_link_libraries(plan_validator_node ${catkin_LIBRARIES})
add_dependencies(plan_validator_node assignment3_generate_messages_cpp)

add_executable(planner_node src/planner_node.cpp)
target_link_libraries(planner_node ${catkin_LIBRARIES})
add_dependencies(planner_node assignment3_generate_messages_cpp)

add_executable(goal_manager_node src/goal_manager_node.cpp)
target_link_libraries(goal_manager_node ${catkin_LIBRARIES})
add_dependencies(goal_manager_node assignment3_generate_messages_cpp)

add_executable(controller_node src/controller_node.cpp)
target_link_libraries(controller_node ${catkin_LIBRARIES})
add_dependencies(controller_node assignment3_generate_messages_cpp)