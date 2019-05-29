#!/bin/bash

intertube=0
starting=1
logpath=/var/log/smartdown.log
date +"Date : %d/%m/%Y Time : %H.%M.%S"

if [ $starting -eq 1 ]; then
	sleep 240
	((starting = 0))
	printf "\n\n\n---------------($date)---------------\n\n"
	echo "beginning ping tests..." >> $logpath
fi

while true
do
	echo "waiting 60 seconds to try again... ($date)" >> $logpath
        sleep 60
	ping -c 3 google.com
        if [ $? -eq 0 ]; then
		((intertube = 0))
                echo "ping success ($date): $intertube" >> $logpath
        else
		((intertube++))
                echo "ping failed ($date): $intertube" >> $logpath
        
		#if intertube is greater than 3 then shuts down
		if [ $intertube -gt 3 ]; then
			echo "no network or power, restarting... ($date)" >> $logpath
			shutdown -P now
		fi
	fi
done
