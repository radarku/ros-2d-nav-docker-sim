#!/bin/bash
source /opt/ros/melodic/setup.bash
export TURTLEBOT3_MODEL=waffle 
roslaunch turtlebot3_slam turtlebot3_remote.launch
