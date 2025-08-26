# mirte_playground

## Building the SE-Robotics Summer School webpages
To build the webpages locally, the environment needs to be setup by running the following (assuming the repo is already cloned).
```sh
cd docs/
python3 -m venv venv
source venv/bin/activate # (Or your OS specific equivalent)
pip install -r requirements.txt
```

Afterwards to build the pages run the following from the docs folder:
```sh
# Make sure the Python environment is sourced
# Linux: source venv/bin/activate

# For a normal build
sphinx-build source build

# For a build which, updates the TOC/Navigation sidebar
sphinx-build source build -Ea
```

## mirte_pddl

### Docker

Run container:

Without docker nvidia
```Bash
docker run -it --rm --name mirte -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -v /dev/dri:/dev/dri -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/localtime:/etc/localtime:ro --network host --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor:unconfined mirte
```

with docker nvidia
```Bash
docker run -it --rm --gpus all --runtime=nvidia --name mirte -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all -v /dev/dri:/dev/dri -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/localtime:/etc/localtime:ro -v $HOME/real_mirte_ws/src/mirte_navigation:/home/ubuntu-user/mirte_ws/src/mirte_navigation -v $HOME/real_mirte_ws/src/mirte_playground:/home/ubuntu-user/mirte_ws/src/mirte_playground --network host --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor:unconfined mirte
```

### Mapping

Navigation stack
```Bash
ros2 launch mirte_navigation real_robot_navigation.launch.py
```

Teleop
```Bash
ros2 run teleop_twist_keyboard teleop_twist_keyboard --ros-args --remap cmd_vel:=/mirte_base_controller/cmd_vel
```

Slam toolbox:
```Bash
ros2 launch slam_toolbox online_async_launch.py use_sim_time:=false
```

RVIZ for visuals:
```Bash
ros2 run rviz2 rviz2 -d /opt/ros/humble/share/nav2_bringup/rviz/nav2_default_view.rviz
```

Save map:
```Bash
ros2 run nav2_map_server map_saver_cli -f my_map
```

### PDDL

```Bash
ros2 launch mirte_navigation real_robot_navigation.launch.py
```

```Bash
ros2 launch mirte_pddl mirte_pddl.launch.py
```
