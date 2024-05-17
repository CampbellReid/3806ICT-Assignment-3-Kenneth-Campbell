# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "assignment3: 10 messages, 6 services")

set(MSG_I_FLAGS "-Iassignment3:/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(assignment3_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg" ""
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg" "assignment3/Goal:geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg" "geometry_msgs/Point:assignment3/Waypoint"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg" "geometry_msgs/Point:assignment3/Obstacle"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg" "assignment3/Map:geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv" "assignment3/SensorData:geometry_msgs/Point:assignment3/Obstacle"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv" "assignment3/Map:assignment3/Obstacle:assignment3/State:assignment3/SensorData:geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv" "assignment3/Waypoint:assignment3/Map:assignment3/Plan:assignment3/State:geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv" "assignment3/Waypoint:assignment3/Map:assignment3/Goal:assignment3/Goals:assignment3/Plan:assignment3/State:geometry_msgs/Point"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv" "assignment3/Feedback:assignment3/Goal:geometry_msgs/Point:assignment3/Goals"
)

get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv" NAME_WE)
add_custom_target(_assignment3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment3" "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv" "assignment3/Plan:geometry_msgs/Point:assignment3/Waypoint"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_msg_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)

### Generating Services
_generate_srv_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_srv_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_srv_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_srv_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_srv_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)
_generate_srv_cpp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
)

### Generating Module File
_generate_module_cpp(assignment3
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(assignment3_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(assignment3_generate_messages assignment3_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_cpp _assignment3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment3_gencpp)
add_dependencies(assignment3_gencpp assignment3_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment3_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_msg_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)

### Generating Services
_generate_srv_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_srv_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_srv_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_srv_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_srv_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)
_generate_srv_eus(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
)

### Generating Module File
_generate_module_eus(assignment3
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(assignment3_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(assignment3_generate_messages assignment3_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_eus _assignment3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment3_geneus)
add_dependencies(assignment3_geneus assignment3_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment3_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_msg_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)

### Generating Services
_generate_srv_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_srv_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_srv_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_srv_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_srv_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)
_generate_srv_lisp(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
)

### Generating Module File
_generate_module_lisp(assignment3
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(assignment3_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(assignment3_generate_messages assignment3_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_lisp _assignment3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment3_genlisp)
add_dependencies(assignment3_genlisp assignment3_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment3_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_msg_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)

### Generating Services
_generate_srv_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_srv_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_srv_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_srv_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_srv_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)
_generate_srv_nodejs(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
)

### Generating Module File
_generate_module_nodejs(assignment3
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(assignment3_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(assignment3_generate_messages assignment3_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_nodejs _assignment3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment3_gennodejs)
add_dependencies(assignment3_gennodejs assignment3_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment3_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_msg_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)

### Generating Services
_generate_srv_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_srv_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_srv_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_srv_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_srv_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)
_generate_srv_py(assignment3
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv"
  "${MSG_I_FLAGS}"
  "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
)

### Generating Module File
_generate_module_py(assignment3
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(assignment3_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(assignment3_generate_messages assignment3_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv" NAME_WE)
add_dependencies(assignment3_generate_messages_py _assignment3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment3_genpy)
add_dependencies(assignment3_genpy assignment3_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment3_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment3
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(assignment3_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(assignment3_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment3
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(assignment3_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(assignment3_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment3
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(assignment3_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(assignment3_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment3
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(assignment3_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(assignment3_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment3
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(assignment3_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(assignment3_generate_messages_py geometry_msgs_generate_messages_py)
endif()
