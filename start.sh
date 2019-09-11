#!/bin/bash
screen -dmS gazebo ./startGazebo.sh
sleep 10
screen -dmS rviz ./startRViz.sh
sleep 2
screen -dmS move_base ./startMoveBase.sh
