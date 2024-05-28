import open3d as o3d
import numpy as np
from sklearn.cluster import DBSCAN
import matplotlib.pyplot as plt

def load_pcd(file_path):
    """Load a PCD file using Open3D."""
    pcd = o3d.io.read_point_cloud(file_path)
    return pcd

def perform_dbscan_clustering(pcd, eps=0.05, min_samples=10):
    """Perform DBSCAN clustering on the point cloud data."""
    # Convert Open3D point cloud to numpy array
    points = np.asarray(pcd.points)
    
    # Perform DBSCAN clustering
    db = DBSCAN(eps=eps, min_samples=min_samples).fit(points)
    labels = db.labels_
    
    return labels

def visualize_clusters(pcd, labels):
    """Visualize clusters in the point cloud."""
    max_label = labels.max()
    colors = plt.get_cmap("tab20")(labels / (max_label if max_label > 0 else 1))
    colors[labels < 0] = 0  # Noise points are colored black

    # Set colors to the point cloud
    pcd.colors = o3d.utility.Vector3dVector(colors[:, :3])
    
    # Visualize the clustered point cloud
    o3d.visualization.draw_geometries([pcd])

if __name__ == "__main__":
    # Path to your PCD file
    pcd_file_path = "/path/to/your/map.pcd"
    
    # Load the PCD file
    pcd = load_pcd(pcd_file_path)
    print("Loaded PCD file with", len(pcd.points), "points")
    
    # Perform DBSCAN clustering
    labels = perform_dbscan_clustering(pcd)
    print("DBSCAN clustering completed with", len(set(labels)) - (1 if -1 in labels else 0), "clusters")
    
    # Visualize the clusters
    visualize_clusters(pcd, labels)
