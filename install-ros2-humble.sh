#!/bin/bash

# Reference: https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html

# Setup Sources

sudo apt install -y software-properties-common
sudo add-apt-repository universe
if ! [ -x $(command -v curl) ];then
  sudo apt update && sudo apt install curl -y
fi
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 packages

sudo apt update
sudo apt upgrade
sudo apt install -y ros-humble-desktop
sudo apt install -y ros-dev-tools
