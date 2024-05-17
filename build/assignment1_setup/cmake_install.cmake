# Install script for directory: /home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment1_setup

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment1_setup/msg" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment1_setup/msg/Sonars.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment1_setup/srv" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment1_setup/srv/ModelState.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment1_setup/cmake" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment1_setup/catkin_generated/installspace/assignment1_setup-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/include/assignment1_setup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/share/roseus/ros/assignment1_setup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/share/common-lisp/ros/assignment1_setup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/share/gennodejs/ros/assignment1_setup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/lib/python3/dist-packages/assignment1_setup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/devel/lib/python3/dist-packages/assignment1_setup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment1_setup/catkin_generated/installspace/assignment1_setup.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment1_setup/cmake" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment1_setup/catkin_generated/installspace/assignment1_setup-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment1_setup/cmake" TYPE FILE FILES
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment1_setup/catkin_generated/installspace/assignment1_setupConfig.cmake"
    "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/build/assignment1_setup/catkin_generated/installspace/assignment1_setupConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/assignment1_setup" TYPE FILE FILES "/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/catkin_ws/src/assignment1_setup/package.xml")
endif()

