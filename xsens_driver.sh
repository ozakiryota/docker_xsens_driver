#!/bin/bash

image_name="xsens_driver"

docker run -it --rm \
	--net=host \
	--privileged \
	$image_name:latest \
	bash -c "source /home/ros_catkin_ws/devel/setup.bash;roslaunch xsens_driver xsens_driver.launch"
