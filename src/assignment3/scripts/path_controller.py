#!/usr/bin/env python

import rospy
from math import atan2, sqrt, cos, sin, pi
from geometry_msgs.msg import Twist
from assessment_3.srv import GetPaths, GetPathsResponse
from geometry_msgs.msg import Quaternion, PoseArray
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import SetModelState, GetModelState, GetModelStateRequest
from tf.transformations import quaternion_from_euler, quaternion_multiply

def move_to_target(x, y, limit, rate):

    # Get robot details
    try:
        gms_request = GetModelStateRequest()
        gms = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        gms_request.relative_entity_name = "world"
        gms_request.model_name = "turtlebot3_burger"
        gms_response = gms(gms_request)
    except rospy.ServiceException as error:
        print("ERROR: Service call GMS --> %s" % error)
        
    ms_msg = ModelState()
    ms_msg.model_name = "turtlebot3_burger"
    
    # Set current position based on previous position (avoid reverting to 0, 0)
    ms_msg.pose.position = gms_response.pose.position

    # Calculate movement direction
    if int(x) > int(ms_msg.pose.position.x) and int(y) == int(ms_msg.pose.position.y):
        ms_msg.pose.orientation.z = 0
        ms_msg.pose.orientation.w = 1
    elif int(x) < int(ms_msg.pose.position.x) and int(y) == int(ms_msg.pose.position.y):
        ms_msg.pose.orientation.z = 1
        ms_msg.pose.orientation.w = 0
    elif int(y) > int(ms_msg.pose.position.y) and int(x) == int(ms_msg.pose.position.x):
        ms_msg.pose.orientation.z = 1
        ms_msg.pose.orientation.w = 1
    elif int(y) < int(ms_msg.pose.position.y) and int(x) == int(ms_msg.pose.position.x):
        ms_msg.pose.orientation.z = -1
        ms_msg.pose.orientation.w = 1

    try:
        smt = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)
        smt_response = smt(ms_msg)
    except rospy.ServiceException as error:
        print("ERROR: Service call SMT --> %s" % error)
    
    # Publish constant speed
    vel_publisher = rospy.Publisher('cmd_vel', Twist, queue_size = 10)
    vel_msg = Twist()
    vel_msg.linear.x = 0.085

    # Keep constant speed until target location reaced
    while max(gms_response.pose.position.x, x) - min(gms_response.pose.position.x, x) > limit or \
          max(gms_response.pose.position.y, y) - min(gms_response.pose.position.y, y) > limit and \
          not rospy.is_shutdown():
          
        # Update current location
        gms_response = gms(gms_request)
        vel_publisher.publish(vel_msg)
        rate.sleep()

    # Target location reached, wait for additional steps
    vel_msg.linear.x = 0
    vel_publisher.publish(vel_msg)
    

def controller():

    # Path controller for executing steps
    rospy.init_node('path_controller', anonymous = True)
    rospy.wait_for_service('paths_service')
    rate = rospy.Rate(0.5)
    
    # Try get path and iterate through steps
    try:
        i = 1
        print("Running...")
        ps_request = rospy.ServiceProxy('paths_service', GetPaths)
        for step in ps_request().paths.poses:
            move_to_target(step.position.x, step.position.y, 0.25, rate)
            print("STEP: ", i)
            i += 1
            rate.sleep()
    except rospy.ServiceException as error:
        print("ERROR: Service failed --> %s" % error)


if __name__ == '__main__':
     try:
         controller()
     except rospy.ROSInterruptException:
         pass
