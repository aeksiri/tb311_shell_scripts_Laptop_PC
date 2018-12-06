#! /bin/bash

#kill in TB3
#Kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

#source files
source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

roscore &

sleep 10

roslaunch turtlebot3_gazebo turtlebot3_stage_1.launch &

sleep 10
roslaunch turtlebot3_dqn result_graph.launch &
roslaunch turtlebot3_dqn turtlebot3_dqn_stage_1.launch



#Kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

echo "TB3_GAZEBO_COMPLETED!!!"
