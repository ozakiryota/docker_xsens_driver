########## Pull ##########
FROM ros:kinetic
# FROM osrf/ros:kinetic-desktop-full
########## Basis ##########
RUN apt-get update && apt-get install -y \
	vim \
	wget \
	unzip \
	git \
	build-essential
########## ROS setup ##########
RUN mkdir -p /home/ros_catkin_ws/src && \
	cd /home/ros_catkin_ws/src && \
	/bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_init_workspace" && \
	cd /home/ros_catkin_ws && \
	/bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_make" && \
	echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc && \
	echo "source /home/ros_catkin_ws/devel/setup.bash" >> ~/.bashrc && \
	echo "export ROS_PACKAGE_PATH=\${ROS_PACKAGE_PATH}:/home/ros_catkin_ws" >> ~/.bashrc && \
	echo "export ROS_WORKSPACE=/home/ros_catkin_ws" >> ~/.bashrc && \
	echo "function cmk(){\n	lastpwd=\$OLDPWD \n	cpath=\$(pwd) \n	cd /home/ros_catkin_ws \n	catkin_make \$@ \n	cd \$cpath \n	OLDPWD=\$lastpwd \n}" >> ~/.bashrc
########## Requirements ##########
RUN apt-get update && \
	apt-get install -y \
		ros-kinetic-tf \
		python-pip && \
	pip install pyserial
########## xsnens ##########
RUN cd /home/ros_catkin_ws/src &&\
	git clone https://github.com/ethz-asl/ethzasl_xsens_driver && \
	cd /home/ros_catkin_ws &&\
	/bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_make"
######### initial position ##########
WORKDIR /home/ros_catkin_ws/src
