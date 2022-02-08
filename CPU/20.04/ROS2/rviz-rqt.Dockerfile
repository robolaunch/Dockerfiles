FROM ubuntu:20.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y install curl gnupg2 lsb-release

######################## INSTALLING ROS
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null


RUN apt update

RUN apt install -y ros-foxy-ros-base

RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
RUN apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

RUN apt install -y ros-foxy-rviz2
RUN apt install -y ros-foxy-rqt

CMD ["bash"]