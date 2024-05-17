#!/usr/bin/env python

import rospy
from assignment3.srv import CollectData, ProcessSensorData, ValidatePlan, CreatePlan, UpdateGoals, ExecutePlan
from assignment3.msg import SensorData, State, Plan, Feedback, Goals

def main():
    rospy.init_node('main_node')

    # Service proxies
    collect_data = rospy.ServiceProxy('collect_data', CollectData)
    process_sensor_data = rospy.ServiceProxy('process_sensor_data', ProcessSensorData)
    validate_plan = rospy.ServiceProxy('validate_plan', ValidatePlan)
    create_plan = rospy.ServiceProxy('create_plan', CreatePlan)
    update_goals = rospy.ServiceProxy('update_goals', UpdateGoals)
    execute_plan = rospy.ServiceProxy('execute_plan', ExecutePlan)

    rate = rospy.Rate(1) # 1 Hz
    while not rospy.is_shutdown():
        # Step 1: Monitor
        sensor_data = collect_data().data

        # Step 2: Interpret
        state = process_sensor_data(sensor_data).state

        # Step 3: Validate Plan
        current_plan = Plan() # Assume current_plan is obtained or initialized
        if not validate_plan(current_plan, state).valid:
            # Step 4: Re-plan if necessary
            feedback = Feedback() # Assume feedback is obtained
            goals = update_goals(feedback).goals
            current_plan = create_plan(state, goals).plan

        # Step 5: Execute Plan
        execute_plan(current_plan)

        rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
