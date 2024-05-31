import open3d as o3d
import numpy as np
import os
import matplotlib.pyplot as plt

def load_point_clouds(filepaths):
    """
    Load point clouds from the given file paths.
    """
    point_clouds = []
    for filepath in filepaths:
        pcd = o3d.io.read_point_cloud(filepath)
        point_clouds.append(pcd)
    return point_clouds

def merge_point_clouds(point_clouds):
    """
    Merge multiple point clouds into a single point cloud.
    """
    merged_pcd = o3d.geometry.PointCloud()
    for pcd in point_clouds:
        merged_pcd += pcd
    return merged_pcd

def discretize_point_cloud(point_cloud, voxel_size=0.05):
    """
    Discretize the point cloud into a voxel grid.
    """
    voxel_grid = o3d.geometry.VoxelGrid.create_from_point_cloud(point_cloud, voxel_size=voxel_size)
    return voxel_grid

def voxel_grid_to_2d_projection(voxel_grid):
    """
    Convert the voxel grid to a 2D projection on the XY plane.
    """
    voxel_coords = np.asarray([voxel.grid_index for voxel in voxel_grid.get_voxels()])
    min_coords = voxel_coords.min(axis=0)
    max_coords = voxel_coords.max(axis=0)
    grid_shape = max_coords - min_coords + 1

    projection = np.zeros((grid_shape[0], grid_shape[1]), dtype=int)

    for voxel in voxel_coords:
        x, y, z = voxel - min_coords
        projection[x, y] += 1

    return projection

def plot_projection(projection):
    """
    Plot the 2D projection using Matplotlib.
    """
    plt.imshow(projection, cmap='hot', interpolation='nearest')
    plt.colorbar(label='Number of occupied voxels')
    plt.xlabel('X coordinate')
    plt.ylabel('Y coordinate')
    plt.title('2D Projection of Voxel Grid')
    plt.show()

def main():
    # Paths to the PCD files
    filepaths = [
        '/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/tb3_0_points.pcd',
        '/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/tb3_1_points.pcd'
    ]
    
    # Check if all PCD files exist
    for filepath in filepaths:
        if not os.path.exists(filepath):
            print(f"File not found: {filepath}")
            return
    
    # Load, merge, and discretize point clouds
    point_clouds = load_point_clouds(filepaths)
    merged_pcd = merge_point_clouds(point_clouds)
    voxel_grid = discretize_point_cloud(merged_pcd, voxel_size=0.05)
    
    # Visualize the resulting voxel grid
    projection = voxel_grid_to_2d_projection(voxel_grid)
    plot_projection(projection)

if __name__ == '__main__':
    main()
