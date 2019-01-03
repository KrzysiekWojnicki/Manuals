#!/bin/bash

#######################################################################################################################
# Check do nagiosa sprawdzajacy czy działa strona z device'ami, czy checki sie wykonuja i czy nie sa w stanie unknown #
# Data utworzenia 2012-10-13											      #
# Autor: jso													      #
#######################################################################################################################
#variables
SOURCE="/tmp/check_dcm"
COUNT=1
COUNT_DEV=1
COUNT_FAIL=0
FAIL_LEVEL=0
WEBSITE="https://www1.dotcom-monitor.com/reporting/card/detail.aspx?uid=35cba429f88041acbf74f91b4350dbaf&ID=0"
#states
STATE_OK=0
STATE_CRITICAL=2

#wget google for teh lulz
wget --timeout=10 --tries=1 -O /dev/null http://google.com &> /dev/null
if [ $? != 0 ]
        then
                echo "NO INTERNET CONNECTION!"
                exit $STATE_CRITICAL;
fi

#download INTERNET to floppy
wget --no-check-certificate --timeout=30 --tries=1 -O $SOURCE $WEBSITE &> /dev/null
FAIL_LEVEL=$?

#WEBSITE IS DOWN http://www.youtube.com/watch?v=W8_Kfjo3VjU
if [ $FAIL_LEVEL != 0 ] 
	then
		echo "Website is down!"
		exit $STATE_CRITICAL;
fi

#dunno lol
COUNT_FAIL=$(grep '^\s*<img' $SOURCE |sed 's/ //g' |grep -v 'stat_ok\|stat_down\|btn-stopped'|wc -l)
if [ $COUNT_FAIL -gt 1 ]
	then
		echo "There are at least two devices with unknown state!"
		exit $STATE_CRITICAL;
fi
COUNT_FAIL=0

#Oh my God, they killed Kenny! You bastards!
for i in $(egrep 'AM|PM' $SOURCE |awk '{ print $5 }') 
	do 
		EXEC_DATE=$(egrep 'AM|PM' $SOURCE|head -n $COUNT|tail -n 1|awk '{ print $4" "$5" "$6 }')
		if [ $(expr $(date --date="$(date --rfc-3339=seconds)" +%s) - $(date --date="$(date --date="$EXEC_DATE" --rfc-3339=seconds)" +%s)) -gt 900 ] 
			then 
			#nie jestem pewien czy to echo ponizej jest potrzebne ale boje sie wykasowac:P
				#echo "$(expr $(date --date="$(date --rfc-3339=seconds)" +%s) - $(date --date="$(date --date="$EXEC_DATE" --rfc-3339=seconds)" +%s))"
				DEAD_DEV=$DEAD_DEV+$(egrep 'AM|PM' $SOURCE -B 2|head -n $COUNT_DEV|tail -n 1|cut -d'>' -f3-|cut -d'<' -f1)+", "
				COUNT_FAIL++
			COUNT_DEV=$(expr $COUNT_DEV + 4)
			COUNT++
		fi
	done
if [ $COUNT_FAIL -gt 1 ]
	then
		echo "There are dead devices: $DEAD_DEV !"
		exit $STATE_CRITICAL 
fi

echo "Dotcom Monitor is fine!"
#rm -f $SOURCE
exit $STATE_OK
