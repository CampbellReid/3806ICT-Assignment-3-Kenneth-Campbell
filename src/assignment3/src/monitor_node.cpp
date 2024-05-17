#include "ros/ros.h"
#include "assignment3/CollectData.h"

bool collect_data(assignment3::CollectData::Request &req, assignment3::CollectData::Response &res) {
    // Simulate sensor data collection
    res.data.position.x = 1.0;
    res.data.position.y = 2.0;
    res.data.speed = 0.5;
    // Add more sensor data as needed
    return true;
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "monitor_node");
    ros::NodeHandle n;

    ros::ServiceServer service = n.advertiseService("collect_data", collect_data);
    ros::spin();

    return 0;
}
