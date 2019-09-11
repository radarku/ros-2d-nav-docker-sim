xhost +local:root

nvidia-docker run -it \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/tmp/mavlink:/tmp/mavlink" \
    -p5760:5760 -p5761:5761 --env HOST_IP=192.168.1.181 \
    turtlebot
xhost -local:root
