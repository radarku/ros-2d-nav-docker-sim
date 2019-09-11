#!/bin/bash
source /opt/ros/melodic/setup.bash
export WS_PATH=/ros_ws/src/rover_launcher
roslaunch /ros_ws/src/rover_launcher/launch/nav_map_indoor.launch
