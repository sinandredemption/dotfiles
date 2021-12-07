#!/bin/bash
# A simple status bar I wrote for dwm which I don't use anymore
#

n=0
wifi=""
wifistr=""
backlight=""
bltstr=""
vol=""
volstr=""
ram=""
ramstr=""
bat=0
batstr=""
datestr=""

while true
do
	# Update Wifi every 10 secs
	if [[ $(expr $n % 2) == 0 ]]; then
		wifi=`iw dev | awk '$1=="ssid"{print $2}'`
		wifistr=" $wifi"
		if [[ "`warp-cli status | grep Status | awk '{print $3}'`" == "Connected" ]]; then
			wifistr="$wifistr (VPN)"
		fi
	fi

	# Update backlight level every 5 secs
	backlight=`xbacklight -get`
	bltstr=" $backlight%"
	
	vol=`pactl list sinks | grep '^[[:space:]]Volume:' | \
    		head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
	volstr=" $vol%"

	# Update free RAM %age every 30 secs
	if [[ $( expr $n % 6 ) == 0 ]]; then
		ram=$(free | grep Mem | awk '{print 100.0 * $3/$2}')
		ramstr=" `printf \"%.1f\" $ram`%"
	fi

	# Update Battery level even 30 secs
	if [[ $( expr $n % 6 ) == 0 ]]; then
		bat=$(cat /sys/class/power_supply/BAT1/capacity)
	
		batstr=""
		if [ $bat -gt 70 ]; then
			batstr=" $bat%"
			if [[ "`cat /sys/class/power_supply/BAT1/status`" == "Charging" ]]; then
				aplay ~/.config/sounds/ding.wav
			fi
		elif [ $bat -lt 25 ]; then
			batstr=" $bat%"
			if [[ "`cat /sys/class/power_supply/BAT1/status`" == "Discharging" ]]; then
				aplay ~/.config/sounds/ding.wav
			fi
		else
			batstr=" $bat%"
		fi

		if [[ "`cat /sys/class/power_supply/BAT1/status`" == "Charging" ]]; then
			batstr="$batstr "
		fi
	fi
	# Update Date every 30 secs
	if [[ $( expr $n % 6 ) == 0 ]]; then
		datestr=`date +"%a, %b %d, %I:%M%p"`
		datestr=" $datestr"
	fi

	strng=" $wifistr | $volstr | $bltstr | $ramstr | $batstr | $datestr "
	xsetroot -name "$strng"

	let n++	
	sleep 5
done
