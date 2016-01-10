#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
	if [ -n `which skype-status` ]
	then
		echo "Skype: `skype-status` | $line" || exit 1
	else
		echo "$line" || exit 1
	fi
done
