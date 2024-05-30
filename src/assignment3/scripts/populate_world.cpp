#include <ros/ros.h>
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <turtlesim/Pose.h>
#include <gazebo_msgs/SpawnModel.h>
#include <cstdlib>

int main(int argc, char* argv[]){
 
    // Initializations
    ros::init(argc, argv, "populate_world");
    ros::NodeHandle node;
    
    // Get the file path parameter from the parameter server
    std::string file_path;
    if (!node.getParam("/test_file_path", file_path)) {
        ROS_ERROR("Failed to get param 'test_file_path'");
        return EXIT_FAILURE;
    }
    
    // Read the Test.txt file to get (x, y) values for spawning objects
    std::ifstream data_file(file_path);
    if (!data_file.is_open()) {
        ROS_ERROR("Failed to open file: %s", file_path.c_str());
        return EXIT_FAILURE;
    }
    
    std::string data_line;
    std::string object;
    int unique = 0;
    int x, y;

    while (getline(data_file, data_line) && data_line != ""){
        
        std::stringstream ss;
        ss << data_line;                // Convert string to stringstream
        ss >> object;                   // First val in txt file is object type
        ss >> x;                        // Second val in txt file is x-value
        ss >> y;                        // Third val in txt file is y-value
        
        // Create service
        gazebo_msgs::SpawnModel sm_srv;
        ros::ServiceClient sm_clt = node.serviceClient<gazebo_msgs::SpawnModel>("/gazebo/spawn_urdf_model");
        
        // Read object.urdf file contents
        std::ifstream urdf_file("src/assessment_3/Test_Worlds/Models/" + object + ".urdf");
        std::string urdf_line;
        
        while (getline(urdf_file, urdf_line) && urdf_line != ""){
            sm_srv.request.model_xml += urdf_line;
        }
        urdf_file.close();
        
        // Set object parameters and spawn
        sm_srv.request.model_name = object + "_" + std::to_string(unique);
        sm_srv.request.reference_frame = "world";
        sm_srv.request.initial_pose.position.x = x;
        sm_srv.request.initial_pose.position.y = y;
        sm_srv.request.initial_pose.position.z = 0;
        unique += 1;  // Increment counter

        // Spawn object
        if (!sm_clt.call(sm_srv)){ 
            ROS_ERROR("ERROR: Failed to call SpawnModel Service");
            return EXIT_FAILURE;
        }
        ROS_INFO("Spawned %s at (x: %d, y: %d)", object.c_str(), x, y);
    }
    data_file.close();
    return EXIT_SUCCESS;
}
