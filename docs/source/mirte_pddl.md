# Mirte with PDDL

[Video of Mirte moving around with PlanSys2](https://www.youtube.com/shorts/LW3ei5E4KZw)

## Run the mission

```Bash
ros2 launch mirte_navigation real_robot_navigation.launch.py
```

```Bash
ros2 launch mirte_pddl mirte_pddl.launch.py
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
**Note:** If you have problems saving the map like this, go to RVIZ and add the slam tool box tool and save the map with the slam toolbox plugin
