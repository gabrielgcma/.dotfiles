#!/bin/bash

if ! mountpoint -q /boot; then
	echo "CRITICAL: /boot is NOT mounted!"
	exit 1
fi

if ! findmnt -n -O rw /boot >/dev/null; then
	echo "CRITICAL: /boot is mounted as READ-ONLY!"
	echo "The EFI (FAT32) partition is blocked or was set as 'dirty' by Windows Fast Startup."
	echo "Access Windows, turn off Fast Boot and restart the machine."
	exit 1
fi

exit 0
