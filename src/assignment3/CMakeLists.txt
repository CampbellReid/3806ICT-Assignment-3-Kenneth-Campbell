cmake_minimum_required(VERSION 3.0.2)
project(assignment3)

find_package(catkin REQUIRED COMPONENTS
  rospy
  roscpp
  gazebo_msgs
  std_msgs
  sensor_msgs
  message_generation
)

add_message_files(
  FILES
  SerialisedDict.msg
)

generate_messages(
  DEPENDENCIES
  gazebo_msgs
  std_msgs
  sensor_msgs
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
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

add_executable(populate_world scripts/populate_world.cpp)

target_link_libraries(populate_world
  ${catkin_LIBRARIES}
)
