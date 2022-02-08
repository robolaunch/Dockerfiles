FROM ubuntu:20.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    gnupg \
    lsb-release \
    curl \
    && rm -rf /var/lib/apt/lists/*

######################## INSTALLING ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN apt update && apt install -y ros-noetic-ros-base

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN apt update && apt install -y \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential \
    ros-noetic-rviz \
    ros-noetic-rqt \
    && rm -rf /var/lib/apt/lists/*

CMD ["bash"]