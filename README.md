
Rover Docker SITL
=================

This Docker Container runs a standalone Rover Gazebo Simulation with a navigation stack for testing.  There are two versions:

1) A version that visually shows Gazebo and RViz, but requires nvidia-docker installed on the host machine.
2) A *headless* version that has no visual frontend, but does not need nvidia-docker.


DockerHub
=========

To run a version with Gazebo and RViz that uses nvidia-docker, run:

```
xhost +local:root

nvidia-docker run -it \
    --env="DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -p9090:9090 \
    radarku/ros-2d-nav-sim
    
xhost -local:root
```

To run the *headless* version, use standard docker and the `headless` DockerHub tag:

```
docker run --rm -it -p9090:9090 radarku/ros-2d-nav-sim:headless
```


Usage
-----

Checkout the code from GitHub...

To build the container:

```
./build.sh
```

To run the container:

```
./run.sh
```

Dependencies
------------

The *headless* version does not have any special dependencies.

For the version that incudes Gazebo and RViz GUIs, we use nvidia-docker.
Instructions for setting up and testing nvidia-docker can be found at:

https://github.com/NVIDIA/nvidia-docker


Notes
-----

This project also has the base framework enabled for forwarding X11 through docker

