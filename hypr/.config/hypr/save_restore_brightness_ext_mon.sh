#!/bin/bash

# This script saves and restores the brightness of an external monitor

BRIGHTNESS_FILE=./ext_mon_brightness

BRIGHTNESS_VCP_CODE="10"

EXT_MON_NUMBER=1

if [ "$1" == "save" ]; then
	ddcutil getvcp $BRIGHTNESS_VCP_CODE -d $EXT_MON_NUMBER --brief | awk '{print $4}' >$BRIGHTNESS_FILE
elif [[ "$1" == "restore" ]]; then
	if [ -f "$BRIGHTNESS_FILE" ]; then
		BRIGHTNESS=$(cat "$BRIGHTNESS_FILE")
		ddcutil setvcp $BRIGHTNESS_VCP_CODE -d $EXT_MON_NUMBER $BRIGHTNESS
	fi
elif [ "$1" == "dim" ]; then
	ddcutil setvcp $BRIGHTNESS_VCP_CODE -d $EXT_MON_NUMBER 5
else
	echo "Usage: $0 [save|restore|dim]"
fi
