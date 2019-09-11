#!/bin/bash
source /opt/ros/melodic/setup.bash
export TURTLEBOT3_MODEL=waffle 
roslaunch turtlebot3_gazebo turtlebot3_house_no_x.launch
