# Install script for directory: /home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment3/msg" TYPE FILE FILES
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Command.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Feedback.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goal.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Goals.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Map.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Obstacle.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Plan.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/SensorData.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/State.msg"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/msg/Waypoint.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment3/srv" TYPE FILE FILES
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CollectData.srv"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ProcessSensorData.srv"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ValidatePlan.srv"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/CreatePlan.srv"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/UpdateGoals.srv"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/srv/ExecutePlan.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment3/cmake" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment3/catkin_generated/installspace/assignment3-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/include/assignment3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/share/roseus/ros/assignment3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/share/common-lisp/ros/assignment3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/share/gennodejs/ros/assignment3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/lib/python3/dist-packages/assignment3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/lib/python3/dist-packages/assignment3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment3/catkin_generated/installspace/assignment3.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment3/cmake" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment3/catkin_generated/installspace/assignment3-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment3/cmake" TYPE FILE FILES
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment3/catkin_generated/installspace/assignment3Config.cmake"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment3/catkin_generated/installspace/assignment3Config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment3" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment3/package.xml")
endif()

