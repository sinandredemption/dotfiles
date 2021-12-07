#!/bin/bash
# Automatically sets backlight based on the time

hour=`date +"%H"`

if   [ $hour -gt  7 ] && [ $hour -lt 11 ] # Morning
then
	xbacklight 15
elif [ $hour -gt 10 ] && [ $hour -lt 17 ] # Afternoon
then
	xbacklight 20
elif [ $hour -gt 16 ] && [ $hour -lt 22 ] # Evening
then
	xbacklight 10
else					  # Night
	xbacklight 5
fi
