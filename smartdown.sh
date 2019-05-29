#!/bin/bash

intertube=0
starting=1
logpath=/var/log/netlog

if [ $starting -eq 1 ]; then
	sleep 240
	((starting = 0))
	echo "beginning ping tests..." >> $logpath
fi

while true
do
	echo "waiting 60 seconds to try again..." >> $logpath
        sleep 60
	ping -c 3 google.com
        if [ $? -eq 0 ]; then
		((intertube = 0))
                echo "ping success: $intertube" >> $logpath
        else
		((intertube++))
                echo "ping failed: $intertube" >> $logpath
        
		#if intertube is greater than 3 then shuts down
		if [ $intertube -gt 3 ]; then
			echo "no network or power, restarting..." >> $logpath
			shutdown -P now
		fi
	fi
done
