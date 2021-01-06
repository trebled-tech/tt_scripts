#!/bin/bash

# exposure value is the tricky part: bright light = 250ish, early-morning light = 500-600, very cloudy outside = 800-1000

v4l2-ctl -d /dev/video1 --set-ctrl=gain=64
v4l2-ctl -d /dev/video1 --set-ctrl=exposure_auto=1
v4l2-ctl -d /dev/video1 --set-ctrl=exposure_absolute=750
v4l2-ctl -d /dev/video1 --set-ctrl=white_balance_temperature_auto=0
v4l2-ctl -d /dev/video1 --set-ctrl=white_balance_temperature=3700

while getopts ":sittingstandingdimbright:" o; do
	case "{$o"} in
		sitting)
			v4l2-ctl -d /dev/video1 --set-ctrl=zoom_absolute=120
    		v4l2-ctl -d /dev/video1 --set-ctrl=tilt_absolute=-36000
			;;
		standing)
			v4l2-ctl -d /dev/video1 --set-ctrl=zoom_absolute=140
    		v4l2-ctl -d /dev/video1 --set-ctrl=tilt_absolute=-12000
			;;
		dim)
			v4l2-ctl -d /dev/video1 --set-ctrl=exposure_absolute=1000
			;;
		bright)
			v4l2-ctl -d /dev/video1 --set-ctrl=exposure_absolute=500
	esac
done
