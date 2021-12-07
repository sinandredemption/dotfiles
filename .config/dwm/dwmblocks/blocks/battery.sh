#!/bin/sh
ICON=""

bat=$(cat /sys/class/power_supply/BAT1/capacity)

# Play sounds if the battery is too high or low
if [ $bat -gt 70 ]; then
	ICON=" "
	if [[ "`cat /sys/class/power_supply/BAT1/status`" == "Charging" ]]; then
	        aplay ~/.config/sounds/ding.wav
	fi
elif [ $bat -lt 25 ]; then
	ICON=" "
	if [[ "`cat /sys/class/power_supply/BAT1/status`" == "Discharging" ]]; then
		aplay ~/.config/sounds/ding.wav
	fi
fi

# Change icon if charger is connected
if [[ "`cat /sys/class/power_supply/BAT1/status`" == "Charging" ]]; then
	ICON=""
fi

printf "$ICON $bat%%"
