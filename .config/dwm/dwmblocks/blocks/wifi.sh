#!/bin/sh

#wifi=`iw dev | awk '$1=="ssid"{print $2}'`
#ICON=" "

ICON=""

if [[ "`warp-cli status 2> /dev/null | grep Status | awk '{print $3}'`" == "Connected" ]]; then
#	wifi="$wifi (VPN)"
	ICON=""
fi
printf "$ICON"
