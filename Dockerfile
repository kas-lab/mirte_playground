# Official ROS 2 Humble base image with Gazebo Fortress pre-installed
FROM ros:humble-ros-core-jammy

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install additional dependencies if needed
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    vim \
    git \
    python3-pip \
    python3-vcstool \
    python3-rosdep \
    xvfb \
    htop \
    mesa-utils \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libglx-mesa0 \
    ros-dev-tools \
    iputils-ping \
    ros-humble-topic-tools \
    ros-humble-rqt-tf-tree \
    fuse \
    libfuse2 \
    xterm \
    && rm -rf /var/lib/apt/lists/*

RUN rosdep init

###Add the USER env var
RUN groupadd -g 1000 ubuntu-user \
    && adduser --disabled-password --gid 1000 --uid 1000 --gecos '' ubuntu-user \
    && adduser ubuntu-user sudo

RUN echo 'ubuntu-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
ENV HOME=/home/ubuntu-user
USER ubuntu-user
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p $HOME/mirte_ws/src

COPY --chown=ubuntu-user:ubuntu-user dependencies.repos $HOME/mirte_ws/dependencies.repos
RUN vcs import $HOME/mirte_ws/src < $HOME/mirte_ws/dependencies.repos

RUN rm -rf $HOME/mirte_ws/src/mirte/mirte_telemetrix_cpp

COPY --chown=ubuntu-user:ubuntu-user mirte_pddl/ $HOME/mirte_ws/src/mirte_playground/mirte_pddl/ 

WORKDIR $HOME/mirte_ws/
RUN ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash \
    && sudo apt update \
    && rosdep update \
    && rosdep install --from-paths src --ignore-src -r -y \
    && sudo rm -rf /var/lib/apt/lists/"]
    
RUN curl -o groot.AppImage https://s3.us-west-1.amazonaws.com/download.behaviortree.dev/groot2_linux_installer/Groot2-v1.6.1-x86_64.AppImage

RUN chmod +x groot.AppImage

## There is a bug with the default setuptools and packaging versions
RUN USER=ubuntu-user python3 -m pip install setuptools==75.8.2  packaging==24.1 empy==3.3.4 pandas masced_bandits
RUN ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash \
    && colcon build --symlink-install \
    && echo 'source ~/mirte_ws/install/setup.bash' >> ~/.bashrc"]
