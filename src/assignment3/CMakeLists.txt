cmake_minimum_required(VERSION 3.0.2)
project(assignment3)

find_package(catkin REQUIRED COMPONENTS
  rospy
  roscpp
  gazebo_msgs
  std_msgs
  sensor_msgs
  geometry_msgs
  message_generation
  nav_msgs
)

add_message_files(
  FILES
  GlobalPoints.msg
)

add_service_files(
  FILES
  UpdateMap.srv
  GetPaths.srv
)

generate_messages(
  DEPENDENCIES
  gazebo_msgs
  std_msgs
  sensor_msgs
  geometry_msgs
  nav_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS
  scripts/lidar_map.py
  scripts/exploration_node.py
  scripts/model_aggregator.py
  scripts/turtlebot_env.py
  scripts/global_map_server.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

add_executable(populate_world scripts/populate_world.cpp)

target_link_libraries(populate_world
  ${catkin_LIBRARIES}
)
