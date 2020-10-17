#!/bin/bash

image_name="xsens_driver"

docker run -it --rm \
	--net=host \
	--privileged \
	$image_name:latest
