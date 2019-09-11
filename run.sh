xhost +local:root

nvidia-docker run -it \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -p9090:9090 \
    turtlebot
xhost -local:root
