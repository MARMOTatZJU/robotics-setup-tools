#!/bin/bash

# references:
# - https://moveit.picknik.ai/humble/doc/tutorials/getting_started/getting_started.html
# - https://moveit.picknik.ai/humble/doc/tutorials/quickstart_in_rviz/quickstart_in_rviz_tutorial.html

source /opt/ros/humble/setup.bash

sudo apt install python3-rosdep

sudo rosdep init
rosdep update
sudo apt update
sudo apt dist-upgrade

sudo apt install python3-colcon-common-extensions
sudo apt install python3-colcon-mixin
colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml
colcon mixin update default

sudo apt install python3-colcon-common-extensions
sudo apt install python3-colcon-mixin
colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml
colcon mixin update default

sudo apt install python3-vcstool

# prepare souce code
mkdir -p ~/ws_moveit/src
cd ~/ws_moveit/src
git clone https://github.com/ros-planning/moveit2_tutorials
vcs import < moveit2_tutorials/moveit2_tutorials.repos

sudo apt update && rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y


# compilation
cd ~/ws_moveit2
colcon build --mixin release --paralle-workers=1  # avoid OOM killer
