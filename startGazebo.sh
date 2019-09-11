#!/bin/bash
source /opt/ros/melodic/setup.bash
export TURTLEBOT3_MODEL=waffle 
roslaunch turtlebot3_gazebo turtlebot3_house.launch
#roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch
