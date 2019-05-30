#!/bin/bash

intertube=0
let currentdate
logpath=/var/log/smartdown.log
let starting=1

if (( starting==1 )); then
	sleep 240
	printf -v currentdate '%(%Y/%m/%d %H:%M:%S)T'
	printf "\n\n\n------------------($currentdate)------------------\n\n" >> $logpath
	echo "beginning ping tests..." >> $logpath
	((starting = 0))
fi

while true
do
        sleep 60
	ping -c 3 google.com
        if [ $? -eq 0 ]; then
		((intertube = 0))
        else
		((intertube++))
		printf -v currentdate '%(%Y/%m/%d %H:%M:%S)T'
                echo "ping failed ($currentdate): $intertube" >> $logpath
        
		#if intertube is greater than 3 then shuts down
		if [ $intertube -gt 3 ]; then
			printf -v currentdate '%(%Y/%m/%d %H:%M:%S)T'
			echo "no network or power, restarting... ($currentdate)" >> $logpath
			shutdown -P now
		fi
	fi
done
