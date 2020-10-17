#!/bin/bash

image_name="xsens_driver"

docker run -it --rm \
	--net=host \
	$image_name:latest \
	-v /dev:/dev \
	bash -c "source /home/ros_catkin_ws/devel/setup.bash;roslaunch xsens_driver xsens.launch"
