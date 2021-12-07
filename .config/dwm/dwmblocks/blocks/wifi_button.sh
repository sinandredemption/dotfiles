#!/bin/sh

if [[ "`warp-cli status | grep Status | awk '{print $3}'`" == "Connected" ]]; then
	warp-cli disconnect
	sudo systemctl stop warp-svc
	sleep 0.25 
	sigdwmblocks 5
else
	sudo systemctl start warp-svc
	sleep 0.2	
	warp-cli connect
        sleep 0.2	
	sigdwmblocks 5
fi
