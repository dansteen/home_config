#!/bin/bash

SIZE=`xrandr --current|grep '*'|awk '{print $1}'`
if [ "$SIZE" == "1280x800" ]
then
	xrandr --output Virtual1 --mode 1920x1200
else
	xrandr --output Virtual1 --mode 1280x800
fi
