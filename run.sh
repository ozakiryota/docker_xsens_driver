#!/bin/bash

image_name="xsens_driver"

docker run -it --rm \
	--net=host \
	-v /dev:/dev \
	$image_name:latest
