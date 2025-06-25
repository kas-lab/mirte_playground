cmake_minimum_required(VERSION 3.8)
project(mirte_pddl)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(nav2_msgs REQUIRED)
find_package(plansys2_executor REQUIRED)

set(dependencies
  ament_cmake
  rclcpp
  std_msgs
  geometry_msgs
  nav2_msgs
  plansys2_executor
)

set(TARGET_NAME mirte_planner)

add_executable(${TARGET_NAME} src/mirte_planner.cpp)

target_include_directories(${TARGET_NAME} PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)
target_compile_features(${TARGET_NAME} PUBLIC c_std_99 cxx_std_17)

ament_target_dependencies(${TARGET_NAME}
  ${dependencies}
)

add_executable(action_move src/action_move.cpp)

target_include_directories(action_move PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)
target_compile_features(action_move PUBLIC c_std_99 cxx_std_17)

ament_target_dependencies(action_move
  ${dependencies}
)

install(TARGETS 
  ${TARGET_NAME}
  action_move
  DESTINATION lib/${PROJECT_NAME}
)

install(DIRECTORY launch
  DESTINATION share/${PROJECT_NAME}
  OPTIONAL
)

install(DIRECTORY config
  DESTINATION share/${PROJECT_NAME}
  OPTIONAL
)

install(DIRECTORY pddl
  DESTINATION share/${PROJECT_NAME}
  OPTIONAL
)

ament_package()
