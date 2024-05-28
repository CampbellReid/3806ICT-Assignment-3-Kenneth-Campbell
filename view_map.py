import open3d as o3d
import numpy as np
import matplotlib.pyplot as plt

# Load the PCD file
pcd = o3d.io.read_point_cloud("lidar_map_data.pcd")

# Extract points
points = np.asarray(pcd.points)

# Check if the point cloud has color information
if pcd.has_colors():
    colors = np.asarray(pcd.colors)
else:
    colors = None

# Plotting the point cloud using matplotlib
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# Scatter plot of the point cloud
if colors is not None:
    ax.scatter(points[:, 0], points[:, 1], points[:, 2], c=colors, s=0.1)
else:
    ax.scatter(points[:, 0], points[:, 1], points[:, 2], c='b', s=0.1)

# Set axis labels
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')

# Show the plot
plt.show()
