
TurtleBot Docker
==============

This Docker Container runs a TurtleBot Gazebo Simulation

Usage
-----

To build the container

```
./build.sh
```

To run the container

```
source ./run.sh
```

Dependencies
------------

The run.sh script relies upon having a hardware accelerated host; I use nvidia-docker.

Instructions for setting up and testing nvidia-docker can be found at

https://github.com/NVIDIA/nvidia-docker


Notes
-----

This project also has the base framework enabled for forwarding X11 through docker


