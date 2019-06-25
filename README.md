
PX4 Video SITL
==============

This Docker Container spins-up a PX4 SITL and exports a representative video stream from the platform

Usage
-----

To build the container

```
docker build -t px4vid .
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



