#!/bin/bash
source /opt/ros/melodic/setup.bash
export TURTLEBOT3_MODEL=waffle 
#roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
roslaunch turtlebot3_slam turtlebot3_gmapping.launch
