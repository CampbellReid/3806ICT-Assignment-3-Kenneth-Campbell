#include "ros/ros.h"
#include "assignment3/ValidatePlan.h"

bool validate_plan(assignment3::ValidatePlan::Request &req, assignment3::ValidatePlan::Response &res) {
    // Validate the current plan based on the state
    res.valid = true; // Replace with actual validation logic
    return true;
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "plan_validator_node");
    ros::NodeHandle n;

    ros::ServiceServer service = n.advertiseService("validate_plan", validate_plan);
    ros::spin();

    return 0;
}
