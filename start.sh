#!/bin/bash
screen -dmS gazebo ./startGazebo.sh
sleep 10
screen -dmS remote ./startRemote.sh
sleep 5
screen -dmS amcl ./startAmcl.sh
sleep 5
screen -dmS gmapping ./startGmapping.sh
sleep 5
screen -dmS movebase ./startMoveBase.sh
