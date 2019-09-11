xhost +local:root

nvidia-docker run -it \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    turtlebot
xhost -local:root
