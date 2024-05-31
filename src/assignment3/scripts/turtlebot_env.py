import gymnasium as gym
from gymnasium import spaces
import numpy as np
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from tf.transformations import euler_from_quaternion
import open3d as o3d
from gazebo_msgs.srv import GetModelState, GetModelStateRequest

class TurtleBotEnv(gym.Env):
    def __init__(self, namespace=''):
        super(TurtleBotEnv, self).__init__()
        
        # Namespace handling
        self.namespace = namespace
        #rospy.loginfo(f"Initializing TurtleBotEnv with namespace: {self.namespace}")
        
        # Action space: Linear and angular velocity
        self.action_space = spaces.Box(low=np.array([-0.2, -2.0]), high=np.array([0.2, 2.0]), dtype=np.float32)
        
        # Observation space: Variable length LiDAR ranges
        self.observation_space = spaces.Box(low=0, high=10, shape=(360,), dtype=np.float32)
        
        # ROS publishers and subscribers
        self.velocity_pub = rospy.Publisher(f'/{self.namespace}/cmd_vel', Twist, queue_size=10)
        self.lidar_sub = rospy.Subscriber(f'/{self.namespace}/scan', LaserScan, self.lidar_callback)
        
        # Global variables to store the latest data
        self.ranges = np.zeros(360)
        self.angles = np.linspace(-np.pi, np.pi, 360)
        self.robot_x = 0.0
        self.robot_y = 0.0
        self.robot_yaw = 0.0
        
        # Global map (point cloud)
        self.global_map = o3d.geometry.PointCloud()
        self.output_file = f'{self.namespace}_lidar_map_data.pcd'
        self.safe_distance = 0.3
        #rospy.loginfo("TurtleBotEnv initialization complete")

    def lidar_callback(self, data):
        rospy.logdebug("LiDAR callback triggered")
        angle_min = data.angle_min
        angle_max = data.angle_max
        angle_increment = data.angle_increment
        ranges = np.array(data.ranges)

        if not np.any(np.isfinite(ranges)):
            rospy.logwarn(f"[{self.namespace}] No valid lidar data received")
            return

        valid_indices = np.isfinite(ranges)
        valid_ranges = ranges[valid_indices]
        valid_angles = angle_min + np.arange(len(valid_ranges)) * angle_increment
        
        self.ranges[:len(valid_ranges)] = valid_ranges
        self.angles[:len(valid_angles)] = valid_angles
        #rospy.loginfo(f"LiDAR data received with {len(valid_ranges)} valid ranges")

    def get_robot_position(self):
        try:
            rospy.wait_for_service(f'/{self.namespace}/gazebo/get_model_state', timeout=2.0)
            get_state = rospy.ServiceProxy(f'/{self.namespace}/gazebo/get_model_state', GetModelState)
            request = GetModelStateRequest()
            request.model_name = self.namespace
            request.relative_entity_name = 'world'
            response = get_state(request)
            x = response.pose.position.x
            y = response.pose.position.y
            orientation_q = response.pose.orientation
            orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
            _, _, yaw = euler_from_quaternion(orientation_list)
            self.robot_x, self.robot_y, self.robot_yaw = x, y, yaw
            #rospy.loginfo(f"Robot position: x={self.robot_x}, y={self.robot_y}, yaw={self.robot_yaw}")
        except rospy.ServiceException as e:
            rospy.logerr(f"Service call failed: {e}")
        except rospy.ROSException as e:
            rospy.logerr(f"Timeout exceeded while waiting for service: {e}")
        except Exception as e:
            rospy.logerr(f"Unexpected error: {e}")

    def update_map(self):
        if len(self.ranges) == 0:
            rospy.logwarn("No LiDAR data received")
            return

        x = self.ranges * np.cos(self.angles + self.robot_yaw) + self.robot_x
        y = self.ranges * np.sin(self.angles + self.robot_yaw) + self.robot_y
        new_points = np.vstack((x, y, np.zeros_like(x))).T
        new_pcd = o3d.geometry.PointCloud()
        new_pcd.points = o3d.utility.Vector3dVector(new_points)
        self.global_map += new_pcd
        #rospy.loginfo(f"Updated map with new points: {new_points.shape[0]} points added")

    def save_map_to_pcd(self):
        o3d.io.write_point_cloud(self.output_file, self.global_map)
        #rospy.loginfo(f"Map data saved to {self.output_file}")

    def step(self, action):
        #rospy.loginfo(f"Received action: {action}")
        vel_cmd = Twist()
        vel_cmd.linear.x = action[0]
        vel_cmd.angular.z = action[1]
        self.velocity_pub.publish(vel_cmd)
        #rospy.loginfo(f"Published velocity command: linear={action[0]}, angular={action[1]}")
        rospy.sleep(0.1)
        self.get_robot_position()
        self.update_map()
        state = self.ranges
        reward = -np.min(state) if np.min(state) < self.safe_distance else np.mean(state)
        done = np.min(state) < self.safe_distance
        info = {}
        #rospy.loginfo(f"Step result - state: {state.shape}, reward: {reward}, done: {done}")
        return state, reward, done, info

    def reset(self):
        #rospy.loginfo("Resetting environment")
        self.global_map.clear()
        self.ranges = np.zeros(360)
        self.robot_x, self.robot_y, self.robot_yaw = 0.0, 0.0, 0.0
        #rospy.loginfo("Environment reset complete")
        return self.ranges

    def render(self, mode='human'):
        rospy.logdebug("Render called but not implemented")

    def close(self):
        #rospy.loginfo("Closing environment and saving map data")
        self.save_map_to_pcd()
        #rospy.loginfo("Environment closed")
