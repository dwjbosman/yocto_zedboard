image:
	docker build --tag yocto_xilinx .
run:
	docker run -ti -e DISPLAY=$$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/dinne:/home/dinne -v /dev/video0:/dev/video0 -v /dev/video1:/dev/video1 --privileged --rm yocto_xilinx bash
#	docker run -ti -e DISPLAY=$$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/dinne:/home/dinne -v /dev/video0:/dev/video0 -v /dev/video1:/dev/video1 --privileged --rm --runtime=nvidia darknet_test bash
