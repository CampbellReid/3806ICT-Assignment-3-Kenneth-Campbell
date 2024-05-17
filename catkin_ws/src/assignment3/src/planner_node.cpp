#include "ros/ros.h"
#include "assignment3/CreatePlan.h"

bool create_plan(assignment3::CreatePlan::Request &req, assignment3::CreatePlan::Response &res) {
    // Create a new plan based on the state and goals
    assignment3::Waypoint waypoint;
    waypoint.position.x = 3.0;
    waypoint.position.y = 4.0;
    res.plan.waypoints.push_back(waypoint);
    return true;
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "planner_node");
    ros::NodeHandle n;

    ros::ServiceServer service = n.advertiseService("create_plan", create_plan);
    ros::spin();

    return 0;
}
