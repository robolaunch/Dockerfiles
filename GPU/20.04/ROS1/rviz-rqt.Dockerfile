FROM nvidia/cuda:11.6.0-runtime-ubuntu20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y gnupg
RUN apt install -y lsb-release && apt-get clean all

######################## INSTALLING ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt install -y curl
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN apt update

RUN apt install -y ros-noetic-ros-base

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

RUN apt install -y ros-noetic-rviz
RUN apt install -y ros-noetic-rqt

CMD ["bash"]