import open3d as o3d
import numpy as np
import os
import matplotlib.pyplot as plt
import networkx as nx

# Define the pattern kernel
pattern_kernel = np.array([
    [0, 0, 0, 0],
    [0, 1, 1, 0],
    [0, 1, 1, 0],
    [0, 0, 0, 0]
])

def convert_grid_to_global_coordinates(match_grid, voxel_size, min_coords):
    match_coords = np.argwhere(match_grid == 2)
    global_coords = (match_coords * voxel_size) + min_coords + (voxel_size / 2)
    return global_coords

def convert_world_to_grid_coordinates(world_coords, voxel_size, min_coords):
    return ((world_coords - min_coords) / voxel_size).astype(int)

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
    
    mask = (
        (points[:, 0] >= x_range[0]) & (points[:, 0] <= x_range[1]) &
        (points[:, 1] >= y_range[0]) & (points[:, 1] <= y_range[1])
    )
    points = points[mask]

    grid_shape = (
        int((x_range[1] - x_range[0]) / voxel_size),
        int((y_range[1] - y_range[0]) / voxel_size)
    )
    occupancy_grid = np.zeros(grid_shape, dtype=int)

    min_coords = np.array([x_range[0], y_range[0]])
    for point in points:
        x, y = ((point[:2] - min_coords) / voxel_size).astype(int)
        occupancy_grid[x, y] += 1

    occupancy_grid[occupancy_grid < min_points_per_voxel] = 0
    occupancy_grid[occupancy_grid > 0] = 1

    return occupancy_grid, min_coords

def apply_strict_pattern_filter(occupancy_grid, pattern_kernel):
    kernel_shape = pattern_kernel.shape
    grid_shape = occupancy_grid.shape
    strict_matches = np.zeros_like(occupancy_grid)

    for i in range(grid_shape[0] - kernel_shape[0] + 1):
        for j in range(grid_shape[1] - kernel_shape[1] + 1):
            sub_region = occupancy_grid[i:i + kernel_shape[0], j:j + kernel_shape[1]]
            if np.array_equal(sub_region, pattern_kernel):
                strict_matches[i + kernel_shape[0] // 2, j + kernel_shape[1] // 2] = 1
    
    return strict_matches

def overlay_matches_on_grid(original_grid, match_grid):
    overlay_grid = np.copy(original_grid)
    overlay_grid[match_grid == 1] = 2
    return overlay_grid

def plot_overlay_grid(overlay_grid, x_range, y_range):
    plt.imshow(overlay_grid.T, cmap='hot', origin='lower', extent=[x_range[0], x_range[1], y_range[0], y_range[1]])
    plt.colorbar(label='Occupancy / Pattern match')
    plt.xlabel('X coordinate')
    plt.ylabel('Y coordinate')
    plt.title('Occupancy Grid with Pattern Matches')
    plt.show(block=False)

def create_graph_from_grid(grid):
    graph = nx.grid_2d_graph(*grid.shape)
    nodes_to_remove = [(i, j) for (i, j) in graph.nodes if grid[i, j] == 1]
    for node in nodes_to_remove:
        graph.remove_node(node)
    return graph

def convert_grid_path_to_world(path, voxel_size, min_coords):
    path = np.array(path)
    world_coords = (path * voxel_size) + min_coords + (voxel_size / 2)
    return world_coords

def find_paths_between_worlds(filepaths, start_world, voxel_size=0.25, x_range=(-5, 5), y_range=(-5, 5), min_points_per_voxel=50):
    if any(not os.path.exists(filepath) for filepath in filepaths):
        raise FileNotFoundError("One or more point cloud files not found.")
    
    point_clouds = load_point_clouds(filepaths)
    merged_pcd = merge_point_clouds(point_clouds)
    
    occupancy_grid, min_coords = create_occupancy_grid(merged_pcd, voxel_size, x_range, y_range, min_points_per_voxel)
    
    strict_matches = apply_strict_pattern_filter(occupancy_grid, pattern_kernel)
    
    overlay_grid = overlay_matches_on_grid(occupancy_grid, strict_matches)
    
    global_coords = convert_grid_to_global_coordinates(overlay_grid, voxel_size, min_coords)
    
    start_grid = tuple(convert_world_to_grid_coordinates(start_world, voxel_size, min_coords))
    
    graph = create_graph_from_grid(overlay_grid)
    
    paths = {}
    for end_world in global_coords:
        end_grid = tuple(convert_world_to_grid_coordinates(end_world, voxel_size, min_coords))
        path = nx.astar_path(graph, start_grid, end_grid)
        world_path = convert_grid_path_to_world(path, voxel_size, min_coords)
        paths[tuple(end_world)] = world_path
    
    plot_overlay_grid(overlay_grid, x_range, y_range)
    
    return paths

# Example usage:
filepaths = [
    '/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/tb3_0_points.pcd',
    '/home/campbell/repos/3806ICT-Assignment-3-Kenneth-Campbell/tb3_1_points.pcd'
]

start_world = np.array([0, 0])
paths = find_paths_between_worlds(filepaths, start_world)
for end_world, path in paths.items():
    print(f"Path from {start_world} to {end_world}:\n", path)
