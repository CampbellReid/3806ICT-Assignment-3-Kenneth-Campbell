#include "ros/ros.h"
#include "assignment3/UpdateGoals.h"

bool update_goals(assignment3::UpdateGoals::Request &req, assignment3::UpdateGoals::Response &res) {
    // Update and prioritize goals based on feedback
    assignment3::Goal goal;
    goal.description = "New goal";
    goal.priority = 1;
    res.goals.primary_goals.push_back(goal);
    return true;
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "goal_manager_node");
    ros::NodeHandle n;

    ros::ServiceServer service = n.advertiseService("update_goals", update_goals);
    ros::spin();

    return 0;
}
