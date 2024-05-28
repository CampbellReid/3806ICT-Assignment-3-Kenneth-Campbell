import gymnasium as gym
from gymnasium import spaces
import numpy as np
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from tf.transformations import euler_from_quaternion
import open3d as o3d
from gazebo_msgs.srv import GetModelState

class TurtleBotEnv(gym.Env):
    def __init__(self, namespace=''):
        super(TurtleBotEnv, self).__init__()
        
        # Namespace handling
        self.namespace = namespace
        
        # Action space: Linear and angular velocity
        self.action_space = spaces.Box(low=np.array([-0.2, -2.0]), high=np.array([0.2, 2.0]), dtype=np.float32)
        
        # Observation space: Lidar ranges
        self.observation_space = spaces.Box(low=0, high=10, shape=(360,), dtype=np.float32)
        
        # ROS publishers and subscribers
        self.velocity_pub = rospy.Publisher(f'{self.namespace}/cmd_vel', Twist, queue_size=10)
        self.lidar_sub = rospy.Subscriber(f'{self.namespace}/scan', LaserScan, self.lidar_callback)
        
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

    def lidar_callback(self, data):
        angle_min = data.angle_min
        angle_max = data.angle_max
        angle_increment = data.angle_increment
        ranges = np.array(data.ranges)
        valid_indices = np.isfinite(ranges)
        self.ranges = ranges[valid_indices]
        self.angles = angle_min + np.arange(len(ranges)) * angle_increment

    def get_robot_position(self):
        try:
            rospy.wait_for_service(f'/{self.namespace}/gazebo/get_model_state', timeout=1.0)
            get_state = rospy.ServiceProxy(f'/{self.namespace}/gazebo/get_model_state', GetModelState)
            response = get_state(model_name='turtlebot3_burger', relative_entity_name='world')
            x = response.pose.position.x
            y = response.pose.position.y
            orientation_q = response.pose.orientation
            orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
            _, _, yaw = euler_from_quaternion(orientation_list)
            self.robot_x, self.robot_y, self.robot_yaw = x, y, yaw
        except rospy.ServiceException as e:
            rospy.logerr("Service call failed: %s" % e)

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

    def save_map_to_pcd(self):
        o3d.io.write_point_cloud(self.output_file, self.global_map)
        rospy.loginfo("Map data saved to {}".format(self.output_file))

    def step(self, action):
        vel_cmd = Twist()
        vel_cmd.linear.x = action[0]
        vel_cmd.angular.z = action[1]
        self.velocity_pub.publish(vel_cmd)
        rospy.sleep(0.1)
        self.get_robot_position()
        self.update_map()
        state = self.ranges
        reward = -np.min(state) if np.min(state) < self.safe_distance else np.mean(state)
        done = np.min(state) < self.safe_distance
        info = {}
        return state, reward, done, info

    def reset(self):
        self.global_map.clear()
        self.ranges = np.zeros(360)
        self.robot_x, self.robot_y, self.robot_yaw = 0.0, 0.0, 0.0
        return self.ranges

    def render(self, mode='human'):
        pass

    def close(self):
        self.save_map_to_pcd()
