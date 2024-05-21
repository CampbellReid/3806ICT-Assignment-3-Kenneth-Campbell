import csv
import matplotlib.pyplot as plt

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

# Function to plot the data
def plot_data(data):
    if len(data) == 0:
        print("No data to plot.")
        return

    x_coords, y_coords = zip(*data)

    plt.figure(figsize=(10, 10))
    plt.plot(x_coords, y_coords, 'b.', markersize=2)
    plt.xlabel('X [m]')
    plt.ylabel('Y [m]')
    plt.title('2D LiDAR Map')
    plt.grid(True)
    plt.show()

if __name__ == '__main__':
    # Load the CSV data
    filename = 'lidar_map_data.csv'
    data = load_csv(filename)

    # Plot the data
    plot_data(data)