#!/bin/bash

# Define the package name
PACKAGE_NAME="assignment3"

# Create package directory structure
mkdir -p src/$PACKAGE_NAME/msg
mkdir -p src/$PACKAGE_NAME/srv
mkdir -p src/$PACKAGE_NAME/src
mkdir -p src/$PACKAGE_NAME/scripts

# Define message files
declare -A msgs
msgs[Command.msg]="geometry_msgs/Point target_position\nfloat32 target_speed"
msgs[Feedback.msg]="bool action_success"
msgs[Goal.msg]="string description\nint32 priority\ngeometry_msgs/Point[] waypoints"
msgs[Goals.msg]="Goal[] primary_goals\nGoal[] secondary_goals"
msgs[Map.msg]="geometry_msgs/Point[] obstacle_positions"
msgs[Obstacle.msg]="geometry_msgs/Point position\nfloat32 size"
msgs[Plan.msg]="Waypoint[] waypoints"
msgs[SensorData.msg]="geometry_msgs/Point position\nfloat32 speed\nObstacle[] obstacles"
msgs[State.msg]="geometry_msgs/Point current_position\nMap environment_map"
msgs[Waypoint.msg]="geometry_msgs/Point position"

# Write message files
for msg in "${!msgs[@]}"; do
  echo -e "${msgs[$msg]}" > src/$PACKAGE_NAME/msg/$msg
done

# Define service files
declare -A srvs
srvs[CollectData.srv]="---\nSensorData data"
srvs[ProcessSensorData.srv]="SensorData data\n---\nState state"
srvs[ValidatePlan.srv]="Plan plan\nState state\n---\nbool valid"
srvs[CreatePlan.srv]="State state\nGoals goals\n---\nPlan plan"
srvs[UpdateGoals.srv]="Feedback feedback\n---\nGoals goals"
srvs[ExecutePlan.srv]="Plan plan\n---\nbool success"

# Write service files
for srv in "${!srvs[@]}"; do
  echo -e "${srvs[$srv]}" > src/$PACKAGE_NAME/srv/$srv
done

# Define source files
declare -A srcs
srcs[monitor_node.cpp]="#include \"ros/ros.h\"\n#include \"assignment3/CollectData.h\"\n\nbool collect_data(assignment3::CollectData::Request &req, assignment3::CollectData::Response &res) {\n    // Simulate sensor data collection\n    res.data.position.x = 1.0;\n    res.data.position.y = 2.0;\n    res.data.speed = 0.5;\n    // Add more sensor data as needed\n    return true;\n}\n\nint main(int argc, char **argv) {\n    ros::init(argc, argv, \"monitor_node\");\n    ros::NodeHandle n;\n\n    ros::ServiceServer service = n.advertiseService(\"collect_data\", collect_data);\n    ros::spin();\n\n    return 0;\n}"
srcs[interpreter_node.cpp]="#include \"ros/ros.h\"\n#include \"assignment3/ProcessSensorData.h\"\n\nbool process_sensor_data(assignment3::ProcessSensorData::Request &req, assignment3::ProcessSensorData::Response &res) {\n    // Process sensor data to update the agent's state\n    res.state.current_position = req.data.position;\n    // Update the environment map and other state information\n    return true;\n}\n\nint main(int argc, char **argv) {\n    ros::init(argc, argv, \"interpreter_node\");\n    ros::NodeHandle n;\n\n    ros::ServiceServer service = n.advertiseService(\"process_sensor_data\", process_sensor_data);\n    ros::spin();\n\n    return 0;\n}"
srcs[plan_validator_node.cpp]="#include \"ros/ros.h\"\n#include \"assignment3/ValidatePlan.h\"\n\nbool validate_plan(assignment3::ValidatePlan::Request &req, assignment3::ValidatePlan::Response &res) {\n    // Validate the current plan based on the state\n    res.valid = true; // Replace with actual validation logic\n    return true;\n}\n\nint main(int argc, char **argv) {\n    ros::init(argc, argv, \"plan_validator_node\");\n    ros::NodeHandle n;\n\n    ros::ServiceServer service = n.advertiseService(\"validate_plan\", validate_plan);\n    ros::spin();\n\n    return 0;\n}"
srcs[planner_node.cpp]="#include \"ros/ros.h\"\n#include \"assignment3/CreatePlan.h\"\n\nbool create_plan(assignment3::CreatePlan::Request &req, assignment3::CreatePlan::Response &res) {\n    // Create a new plan based on the state and goals\n    assignment3::Waypoint waypoint;\n    waypoint.position.x = 3.0;\n    waypoint.position.y = 4.0;\n    res.plan.waypoints.push_back(waypoint);\n    return true;\n}\n\nint main(int argc, char **argv) {\n    ros::init(argc, argv, \"planner_node\");\n    ros::NodeHandle n;\n\n    ros::ServiceServer service = n.advertiseService(\"create_plan\", create_plan);\n    ros::spin();\n\n    return 0;\n}"
srcs[goal_manager_node.cpp]="#include \"ros/ros.h\"\n#include \"assignment3/UpdateGoals.h\"\n\nbool update_goals(assignment3::UpdateGoals::Request &req, assignment3::UpdateGoals::Response &res) {\n    // Update and prioritize goals based on feedback\n    assignment3::Goal goal;\n    goal.description = \"New goal\";\n    goal.priority = 1;\n    res.goals.primary_goals.push_back(goal);\n    return true;\n}\n\nint main(int argc, char **argv) {\n    ros::init(argc, argv, \"goal_manager_node\");\n    ros::NodeHandle n;\n\n    ros::ServiceServer service = n.advertiseService(\"update_goals\", update_goals);\n    ros::spin();\n\n    return 0;\n}"
srcs[controller_node.cpp]="#include \"ros/ros.h\"\n#include \"assignment3/ExecutePlan.h\"\n\nbool execute_plan(assignment3::ExecutePlan::Request &req, assignment3::ExecutePlan::Response &res) {\n    // Execute the plan by sending commands to the environment\n    // Simulate success for now\n    res.success = true;\n    return true;\n}\n\nint main(int argc, char **argv) {\n    ros::init(argc, argv, \"controller_node\");\n    ros::NodeHandle n;\n\n    ros::ServiceServer service = n.advertiseService(\"execute_plan\", execute_plan);\n    ros::spin();\n\n    return 0;\n}"
srcs[main.py]="#!/usr/bin/env python\n\nimport rospy\nfrom assignment3.srv import CollectData, ProcessSensorData, ValidatePlan, CreatePlan, UpdateGoals, ExecutePlan\n\n\ndef main():\n    rospy.init_node('main_node')\n\n    # Service proxies\n    collect_data = rospy.ServiceProxy('collect_data', CollectData)\n    process_sensor_data = rospy.ServiceProxy('process_sensor_data', ProcessSensorData)\n    validate_plan = rospy.ServiceProxy('validate_plan', ValidatePlan)\n    create_plan = rospy.ServiceProxy('create_plan', CreatePlan)\n    update_goals = rospy.ServiceProxy('update_goals', UpdateGoals)\n    execute_plan = rospy.ServiceProxy('execute_plan', ExecutePlan)\n\n    rate = rospy.Rate(1) # 1 Hz\n    while not rospy.is_shutdown():\n        # Step 1: Monitor\n        sensor_data = collect_data().data\n\n        # Step 2: Interpret\n        state = process_sensor_data(sensor_data).state\n\n        # Step 3: Validate Plan\n        current_plan = Plan() # Assume current_plan is obtained or initialized\n        if not validate_plan(current_plan, state).valid:\n            # Step 4: Re-plan if necessary\n            feedback = Feedback() # Assume feedback is obtained\n            goals = update_goals(feedback).goals\n            current_plan = create_plan(state, goals).plan\n\n        # Step 5: Execute Plan\n        execute_plan(current_plan)\n\n        # Update environment (simulates changes in the environment)\n        rospy.wait_for_service('update_environment')\n        update_environment()\n\n        rate.sleep()\n\nif __name__ == '__main__':\n    try:\n        main()\n    except rospy.ROSInterruptException:\n        pass\n"

# Write source files
for src in "${!srcs[@]}"; do
  echo -e "${srcs[$src]}" > src/$PACKAGE_NAME/src/$src
done

chmod +x src/$PACKAGE_NAME/scripts/main.py

echo "Setup complete. Run 'catkin_make' in your catkin workspace to build the package."
