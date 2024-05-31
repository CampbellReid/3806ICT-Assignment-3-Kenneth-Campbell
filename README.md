# Project README

## Introduction

This document outlines the steps required to set up and run the project on an x64 Ubuntu 20.04 Linux system. Please note that while attempts have been made to run this project on macOS, it is not recommended due to unresolved issues. Windows has not been tested, and support is only available for x64 Ubuntu 20.04 Linux.

## Prerequisites

- **Conda**: Ensure you have Conda installed on your system.
- **ROS Noetic**: This project requires ROS Noetic.

## Setting Up the Environment

1. **Create the Conda Environment**:
   Use the `environment.yml` file to set up the Conda environment.
   ```bash
   conda env create -f environment.yml
   ```

2. **Activate the Conda Environment**:
   ```bash
   conda activate ros_noetic
   ```

3. **Copy Activation and Deactivation Scripts**:
   Copy the `ros-post-activate.sh` and `ros-post-deactivate.sh` scripts to the `ros_noetic` part of the environment.
   ```bash
   cp ros-post-activate.sh $CONDA_PREFIX/etc/conda/activate.d/
   cp ros-post-deactivate.sh $CONDA_PREFIX/etc/conda/deactivate.d/
   ```

## Configuration

1. **Update Hardcoded File Paths**:
   Go through the source files and replace any hardcoded file paths with the correct paths for your file system.

2. **Modify Environment Variables**:
   Review and update any environment variables in the `activate` script to match your system configuration.

## Installing Required Packages

There are some packages which we have assumed you have installed. If they are not available, follow tutorials online to install them. Usually, they can be installed through:
```bash
sudo apt-get install ros-noetic-package-name
```
Otherwise, search the ROS documentation and tutorials for further guidance.

## Building the Project

1. **Navigate to the Top-Level Directory**:
   Change directory to the top-level folder of the project.
   ```bash
   cd /path/to/top-level/folder
   ```

2. **Run `catkin_make`**:
   Generate the build and devel folders using `catkin_make`.
   ```bash
   catkin_make
   ```

3. **Reactivate the Environment**:
   After building, deactivate and then reactivate the `ros_noetic` environment to ensure all changes take effect.
   ```bash
   conda deactivate
   conda activate ros_noetic
   ```

## Running the Project

To run the project, follow these steps:

1. **Open Four Terminal Windows**:
   Ensure you have four terminal windows open, each with the `ros_noetic` environment activated.

2. **Activate the Environment in Each Terminal**:
   ```bash
   conda activate ros_noetic
   ```

3. **Run `roscore`**:
   In the first terminal, start the ROS core:
   ```bash
   roscore
   ```

4. **Launch the World**:
   In the second terminal, run:
   ```bash
   roslaunch assignment3 world.launch
   ```
   Wait until Gazebo is fully loaded before proceeding.

5. **Launch the Environment**:
   In the third terminal, run:
   ```bash
   roslaunch assignment3 env.launch
   ```

6. **Launch the Bots**:
   In the fourth terminal, run:
   ```bash
   roslaunch assignment3 bots.launch
   ```

## Important Notes

- **Activation in Each Terminal**:
  Ensure you activate the `ros_noetic` environment in each terminal window you use for this project. Alternatively, add the activation command to your `.bashrc` file for automatic activation.
  ```bash
  echo "conda activate ros_noetic" >> ~/.bashrc
  source ~/.bashrc
  ```

- **Support Limitations**:
  Support is only provided for x64 Ubuntu 20.04 Linux. If you encounter issues on any other OS, assistance cannot be guaranteed.

## Contact

For further questions or assistance, please reach out to:

- Campbell Reid (s5220037) (campbell.reid@griffithuni.edu.au)
- Kenneth Foley (s5275083) (kenneth.foley@griffithuni.edu.au)

## Conclusion

Following these steps will ensure that your environment is correctly set up to run the project. If you encounter any issues or have additional questions, please do not hesitate to contact the support personnel listed above.