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