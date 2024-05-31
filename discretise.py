import open3d as o3d
import numpy as np
import os
import matplotlib.pyplot as plt
from scipy.ndimage import convolve

# Define the pattern kernel
pattern_kernel = np.array([
    [0, 0, 0, 0],
    [0, 1, 1, 0],
    [0, 1, 1, 0],
    [0, 0, 0, 0]
])

def load_point_clouds(filepaths):
    point_clouds = []
    for filepath in filepaths:
        pcd = o3d.io.read_point_cloud(filepath)
        point_clouds.append(pcd)
    return point_clouds

def merge_point_clouds(point_clouds):
    merged_pcd = o3d.geometry.PointCloud()
    for pcd in point_clouds:
        merged_pcd += pcd
    return merged_pcd

def create_occupancy_grid(point_cloud, voxel_size=0.05, x_range=(-5, 5), y_range=(-5, 5), min_points_per_voxel=1):
    points = np.asarray(point_cloud.points)
    
    # Filter points within the specified range
    mask = (
        (points[:, 0] >= x_range[0]) & (points[:, 0] <= x_range[1]) &
        (points[:, 1] >= y_range[0]) & (points[:, 1] <= y_range[1])
    )
    points = points[mask]

    # Initialize 2D occupancy grid
    grid_shape = (
        int((x_range[1] - x_range[0]) / voxel_size),
        int((y_range[1] - y_range[0]) / voxel_size)
    )
    occupancy_grid = np.zeros(grid_shape, dtype=int)

    # Populate the occupancy grid
    min_coords = np.array([x_range[0], y_range[0]])
    for point in points:
        x, y = ((point[:2] - min_coords) / voxel_size).astype(int)
        occupancy_grid[x, y] += 1

    # Filter out weak voxels
    occupancy_grid[occupancy_grid < min_points_per_voxel] = 0
    
    # Anything not zero is considered occupied
    occupancy_grid[occupancy_grid > 0] = 1

    return occupancy_grid, min_coords

def apply_strict_pattern_filter(occupancy_grid, pattern_kernel):
    kernel_shape = pattern_kernel.shape
    grid_shape = occupancy_grid.shape
    strict_matches = np.zeros_like(occupancy_grid)

    # Iterate over each possible position in the grid
    for i in range(grid_shape[0] - kernel_shape[0] + 1):
        for j in range(grid_shape[1] - kernel_shape[1] + 1):
            # Extract the sub-region of the grid
            sub_region = occupancy_grid[i:i + kernel_shape[0], j:j + kernel_shape[1]]
            # Check if the sub-region matches the pattern exactly
            if np.array_equal(sub_region, pattern_kernel):
                strict_matches[i + kernel_shape[0] // 2, j + kernel_shape[1] // 2] = 1
    
    return strict_matches


def overlay_matches_on_grid(original_grid, match_grid):
    overlay_grid = np.copy(original_grid)
    overlay_grid[match_grid == 1] = 2  # Use a distinct value to indicate matches
    return overlay_grid

def plot_overlay_grid(overlay_grid, x_range, y_range):
    plt.imshow(overlay_grid.T, cmap='hot', origin='lower', extent=[x_range[0], x_range[1], y_range[0], y_range[1]])
    plt.colorbar(label='Occupancy / Pattern match')
    plt.xlabel('X coordinate')
    plt.ylabel('Y coordinate')
    plt.title('Occupancy Grid with Pattern Matches')
    plt.show()

def main():
    filepaths = [
        '/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/tb3_0_points.pcd',
        '/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/tb3_1_points.pcd'
    ]
    
    for filepath in filepaths:
        if not os.path.exists(filepath):
            print(f"File not found: {filepath}")
            return
    
    point_clouds = load_point_clouds(filepaths)
    merged_pcd = merge_point_clouds(point_clouds)
    
    occupancy_grid, min_coords = create_occupancy_grid(merged_pcd, voxel_size=0.25, x_range=(-5, 5), y_range=(-5, 5), min_points_per_voxel=50)
    
    print("Occupancy Grid:\n", occupancy_grid)
    print("Pattern Kernel:\n", pattern_kernel)
    print("Pattern Kernel Sum:", np.sum(pattern_kernel))
    
    strict_matches = apply_strict_pattern_filter(occupancy_grid, pattern_kernel)
    print("Strict Matches:\n", strict_matches)
    
    overlay_grid = overlay_matches_on_grid(occupancy_grid, strict_matches)
    plot_overlay_grid(overlay_grid, x_range=(-5, 5), y_range=(-5, 5))

if __name__ == '__main__':
    main()
