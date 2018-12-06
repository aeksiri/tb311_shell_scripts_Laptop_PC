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

#source files
source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

#rosmaster
roscore &

sleep 5

#raspi_camera
ssh tb311@10.42.0.111 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://10.42.0.1:11311 && export ROS_HOSTNAME=10.42.0.111 && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./raspi_camera.sh' &

sleep 10

#instrinsic_camera
export AUTO_IN_CALIB=action
export GAZEBO_MODE=false
ssh tb311@10.42.0.111 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://10.42.0.1:11311 && export ROS_HOSTNAME=10.42.0.111 && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./instrinsic_camera.sh' &

sleep 10

#extrinsic_camera
export AUTO_EX_CALIB=calibration
roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera_calibration.launch &

sleep 10
 
#detect_lane
export AUTO_DT_CALIB=calibration
roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch &

sleep 10

#image
rqt_image_view &

sleep 5

#setting parameter in image
rosrun rqt_reconfigure rqt_reconfigure

sleep 5

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

#kill in LAPTOP
killall -9 ssh
killall -9 roslaunch
killall -9 rosout
killall -9 rosmaster

echo "tunning Completed!!!"




