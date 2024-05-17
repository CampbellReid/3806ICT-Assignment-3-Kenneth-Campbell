# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(WARNING "Invoking generate_messages() without having added any message or service file before.
You should either add add_message_files() and/or add_service_files() calls or remove the invocation of generate_messages().")
message(STATUS "assignment2: 0 messages, 0 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Iassignment1_setup:/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment1_setup/msg;-Igazebo_msgs:/opt/ros/noetic/share/gazebo_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/noetic/share/trajectory_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(assignment2_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_cpp(assignment2
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment2
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(assignment2_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(assignment2_generate_messages assignment2_generate_messages_cpp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(assignment2_gencpp)
add_dependencies(assignment2_gencpp assignment2_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment2_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_eus(assignment2
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment2
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(assignment2_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(assignment2_generate_messages assignment2_generate_messages_eus)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(assignment2_geneus)
add_dependencies(assignment2_geneus assignment2_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment2_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_lisp(assignment2
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment2
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(assignment2_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(assignment2_generate_messages assignment2_generate_messages_lisp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(assignment2_genlisp)
add_dependencies(assignment2_genlisp assignment2_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment2_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_nodejs(assignment2
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment2
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(assignment2_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(assignment2_generate_messages assignment2_generate_messages_nodejs)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(assignment2_gennodejs)
add_dependencies(assignment2_gennodejs assignment2_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment2_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_py(assignment2
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment2
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(assignment2_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(assignment2_generate_messages assignment2_generate_messages_py)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(assignment2_genpy)
add_dependencies(assignment2_genpy assignment2_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment2_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment2)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment2
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(assignment2_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET assignment1_setup_generate_messages_cpp)
  add_dependencies(assignment2_generate_messages_cpp assignment1_setup_generate_messages_cpp)
endif()
if(TARGET gazebo_msgs_generate_messages_cpp)
  add_dependencies(assignment2_generate_messages_cpp gazebo_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment2)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment2
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(assignment2_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET assignment1_setup_generate_messages_eus)
  add_dependencies(assignment2_generate_messages_eus assignment1_setup_generate_messages_eus)
endif()
if(TARGET gazebo_msgs_generate_messages_eus)
  add_dependencies(assignment2_generate_messages_eus gazebo_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment2)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment2
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(assignment2_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET assignment1_setup_generate_messages_lisp)
  add_dependencies(assignment2_generate_messages_lisp assignment1_setup_generate_messages_lisp)
endif()
if(TARGET gazebo_msgs_generate_messages_lisp)
  add_dependencies(assignment2_generate_messages_lisp gazebo_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment2)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment2
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(assignment2_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET assignment1_setup_generate_messages_nodejs)
  add_dependencies(assignment2_generate_messages_nodejs assignment1_setup_generate_messages_nodejs)
endif()
if(TARGET gazebo_msgs_generate_messages_nodejs)
  add_dependencies(assignment2_generate_messages_nodejs gazebo_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment2)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment2\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment2
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(assignment2_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET assignment1_setup_generate_messages_py)
  add_dependencies(assignment2_generate_messages_py assignment1_setup_generate_messages_py)
endif()
if(TARGET gazebo_msgs_generate_messages_py)
  add_dependencies(assignment2_generate_messages_py gazebo_msgs_generate_messages_py)
endif()
