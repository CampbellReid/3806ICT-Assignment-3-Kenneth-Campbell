#include "ros/ros.h"
#include "assignment3/ExecutePlan.h"

bool execute_plan(assignment3::ExecutePlan::Request &req, assignment3::ExecutePlan::Response &res) {
    // Execute the plan by sending commands to the environment
    // Simulate success for now
    res.success = true;
    return true;
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "controller_node");
    ros::NodeHandle n;

    ros::ServiceServer service = n.advertiseService("execute_plan", execute_plan);
    ros::spin();

    return 0;
}
