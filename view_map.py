import csv
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import DBSCAN

# Function to load CSV data
def load_csv(filename):
    data = []
    with open(filename, 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        next(csvreader)  # Skip header
        for row in csvreader:
            x, y = float(row[0]), float(row[1])
            data.append((x, y))
    return data

# Function to plot the data and clusters
def plot_data(data, clusters, cluster_centers):
    if len(data) == 0:
        print("No data to plot.")
        return

    x_coords, y_coords = zip(*data)
    plt.figure(figsize=(10, 10))
    plt.plot(x_coords, y_coords, 'b.', markersize=2, label='All Points')

    for cluster_idx in clusters:
        cluster_points = np.array(clusters[cluster_idx])
        plt.plot(cluster_points[:, 0], cluster_points[:, 1], 'o', markersize=5, label=f'Cluster {cluster_idx}')
        center = cluster_centers[cluster_idx]
        plt.plot(center[0], center[1], 'rx', markersize=10, label=f'Center {cluster_idx}')

    plt.xlabel('X [m]')
    plt.ylabel('Y [m]')
    plt.title('2D LiDAR Map with Clusters')
    plt.grid(True)
    plt.legend()
    plt.show()

# Function to find clusters using DBSCAN
def find_clusters(data, eps=0.1, min_samples=10):
    db = DBSCAN(eps=eps, min_samples=min_samples).fit(data)
    labels = db.labels_
    unique_labels = set(labels)

    clusters = {}
    cluster_centers = {}
    
    for label in unique_labels:
        if label == -1:
            continue  # Ignore noise points
        
        cluster_points = data[labels == label]
        clusters[label] = cluster_points
        
        # Compute the center of the cluster
        center = np.mean(cluster_points, axis=0)
        cluster_centers[label] = center
    
    return clusters, cluster_centers

if __name__ == '__main__':
    # Load the CSV data
    filename = 'lidar_map_data.csv'
    data = load_csv(filename)
    data = np.array(data)

    # Find clusters in the data
    clusters, cluster_centers = find_clusters(data)

    # Plot the data with clusters
    plot_data(data, clusters, cluster_centers)

    # Print the cluster centers
    print("Cluster Centers:")
    for idx, center in cluster_centers.items():
        print(f"Cluster {idx}: {center}")
