#!/usr/bin/env python

import rospy
from assignment3.srv import CollectData, ProcessSensorData, ValidatePlan, CreatePlan, ExecutePlan
from std_msgs.msg import Float32MultiArray

def main():
    rospy.init_node('main_node')

    # Wait for the services to be available
    rospy.wait_for_service('collect_data')
    rospy.wait_for_service('process_sensor_data')
    rospy.wait_for_service('validate_plan')
    rospy.wait_for_service('create_plan')
    rospy.wait_for_service('execute_plan')

    # Create service proxies
    collect_data = rospy.ServiceProxy('collect_data', CollectData)
    process_sensor_data = rospy.ServiceProxy('process_sensor_data', ProcessSensorData)
    validate_plan = rospy.ServiceProxy('validate_plan', ValidatePlan)
    create_plan = rospy.ServiceProxy('create_plan', CreatePlan)
    execute_plan = rospy.ServiceProxy('execute_plan', ExecutePlan)

    rate = rospy.Rate(1)  # 1 Hz

    while not rospy.is_shutdown():
        # Step 1: Monitor
        sensor_data = collect_data().data

        # Step 2: Interpret
        state = process_sensor_data(sensor_data).state

        # Step 3: Validate Plan
        current_plan = Float32MultiArray()  # Assume current_plan is obtained or initialized
        if not validate_plan(current_plan, state).valid:
            # Step 4: Re-plan if necessary
            goals = Float32MultiArray()  # Assume goals are obtained
            current_plan = create_plan(state, goals).plan

        # Step 5: Execute Plan
        execute_plan(current_plan)

        rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
