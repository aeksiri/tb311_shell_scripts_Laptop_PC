#! /bin/bash

#kill in TB3
ssh tb311@10.42.0.111 'killall -9 bash'
ssh tb311@10.42.0.111 'killall -9 bringup.sh'
ssh tb311@10.42.0.111 'killall -9 python'
ssh tb311@10.42.0.111 'killall -9 hlds_laser_publisher'
ssh tb311@10.42.0.111 'killall -9 turtlebot3_diagnostics'
ssh tb311@10.42.0.111 'killall -9 sshd'
ssh tb311@10.42.0.111 'killall -9 raspi_camera.sh'
ssh tb311@10.42.0.111 'killall -9 roslaunch'
ssh tb311@10.42.0.111 'killall -9 raspicam_node'

#Kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

#run master
roscore &

sleep 5 

#bringup in TB3
ssh tb311@10.42.0.111 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://10.42.0.1:11311 && export ROS_HOSTNAME=10.42.0.111 && export TURTLEBOT3_MODEL=burger && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./bringup.sh' &

#blockly
cd ~/catkin_ws
source devel/setup.bash
roslaunch turtlebot3_blockly turtlebot3_blockly.launch

#kill in TB3
ssh tb311@10.42.0.111 'killall -9 bash'
ssh tb311@10.42.0.111 'killall -9 bringup.sh'
ssh tb311@10.42.0.111 'killall -9 python'
ssh tb311@10.42.0.111 'killall -9 hlds_laser_publisher'
ssh tb311@10.42.0.111 'killall -9 turtlebot3_diagnostics'
ssh tb311@10.42.0.111 'killall -9 sshd'
ssh tb311@10.42.0.111 'killall -9 raspi_camera.sh'
ssh tb311@10.42.0.111 'killall -9 roslaunch'
ssh tb311@10.42.0.111 'killall -9 raspicam_node'

#Kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster
echo "blockly Completed!!!"
