#!/bin/bash

image_name="xsens_driver"

docker run -it --rm \
	--net=host \
	$image_name:latest
