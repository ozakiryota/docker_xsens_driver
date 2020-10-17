#!/bin/bash

image_name="xsens_driver"

docker run -it --rm \
	--net=host \
	--privileged \
	$image_name:latest \
	bash -c "source /home/ros_catkin_ws/devel/setup.bash;rosrun xsens_driver mtdevice.py -c oq100,aa100,wr100;roslaunch xsens_driver xsens_driver.launch"
