# mirte_playground

## Docker

Run container:
```Bash
docker run -it --rm --gpus all --runtime=nvidia --name mirte -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all -v /dev/dri:/dev/dri -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/localtime:/etc/localtime:ro -v $HOME/real_mirte_ws/src/mirte_navigation:/home/ubuntu-user/mirte_ws/src/mirte_navigation -v $HOME/real_mirte_ws/src/mirte_playground:/home/ubuntu-user/mirte_ws/src/mirte_playground --network host mirte
```

## Mapping

Navigation stack
```Bash
ros2 launch mirte_navigation real_robot_navigation.launch.py
```

Telop
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

## PDDL

```Bash
ros2 launch mirte_navigation real_robot_navigation.launch.py
```

```Bash
ros2 launch mirte_pddl mirte_pddl.launch.py
```
