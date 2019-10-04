FROM ros:melodic-perception
LABEL maintainer Kyle Usbeck

# Trick to get apt-get to not prompt for timezone in tzdata
ENV DEBIAN_FRONTEND=noninteractive

# install GLX-Gears and the GL Vendor-Neutral Dispatch library
RUN apt-get update && apt-get install -y \
    libglvnd0 \
    mesa-utils && \
    rm -rf /var/lib/apt/lists/*

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# Env Variables
ENV PX4_HOME_LAT 42.3898
ENV PX4_HOME_LON -71.1476
ENV PX4_HOME_ALT 14.2
ENV HOST_IP 192.168.1.211

# Install MAVROS and some other dependencies for later
RUN apt-get update && apt-get install -y git vim wget screen sudo lsb-release tzdata wget

# Dependency from https://github.com/mavlink/mavros/blob/master/mavros/README.md
RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
RUN chmod +x install_geographiclib_datasets.sh
RUN ./install_geographiclib_datasets.sh

RUN apt-get update && apt-get install -y ros-melodic-move-base ros-melodic-move-base-msgs ros-melodic-desktop-full ros-melodic-slam-gmapping ros-melodic-map-server ssh ros-melodic-rosbridge-suite ros-melodic-apriltag-ros ros-melodic-turtlebot3-gazebo python-opencv python-wxgtk3.0 python3-pip python3-matplotlib python-pygame python3-lxml python3-yaml socat ros-melodic-mavros ros-melodic-mavros-extras ros-melodic-mavros-msgs vim wget screen sudo lsb-release tzdata wget ros-melodic-mavros ros-melodic-mavros-extras ros-melodic-mavros-msgs ros-melodic-turtlebot3 ros-melodic-dwa-local-planner ros-melodic-hector-gazebo ros-melodic-hector-components-description ros-melodic-hector-models ros-melodic-hector-sensors-description ros-melodic-hector-sensors-gazebo 

# Configure Bash & Screen
RUN echo ". /opt/ros/melodic/setup.bash" >> ~/.bashrc 
RUN echo "defshell -bash" > ~/.screenrc

# Make our own workspace
#RUN mkdir -p /ros_ws/src/
#COPY frontier_exploration.tar.gz /ros_ws/src/
#RUN . /opt/ros/melodic/setup.sh && cd /ros_ws/src/ && tar -xzvf frontier_exploration.tar.gz && rm frontier_exploration.tar.gz && cd .. && catkin_make install; cd /

# Start Scripts for Robot
COPY start.sh /
COPY startAmcl.sh /
COPY startFrontier.sh /
COPY startGazebo.sh /
COPY startGmapping.sh /
COPY startMoveBase.sh /
COPY startRViz.sh /
COPY startRemote.sh /
COPY startRosBridge.sh /
COPY stop.sh /

# Add some launch files to TurtleBot
COPY turtlebot3_amcl.launch /opt/ros/melodic/share/turtlebot3_slam/launch/
COPY turtlebot3_remote.launch /opt/ros/melodic/share/turtlebot3_slam/launch/
COPY turtlebot3_movebase.launch /opt/ros/melodic/share/turtlebot3_slam/launch/
COPY turtlebot3_rviz.launch /opt/ros/melodic/share/turtlebot3_slam/launch/
COPY turtlebot3_house.launch /opt/ros/melodic/share/turtlebot3_gazebo/launch/
COPY turtlebot3_waffle.gazebo.xacro /opt/ros/melodic/share/turtlebot3_description/urdf/

# Entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh ${HOST_IP}

