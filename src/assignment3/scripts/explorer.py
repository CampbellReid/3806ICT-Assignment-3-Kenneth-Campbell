#!/usr/bin/env python

import rospy

def emptier():
    rospy.init_node('explorer')
    
    # Add your code here
    
    rospy.spin()

if __name__ == '__main__':
    try:
        emptier()
    except rospy.ROSInterruptException:
        pass