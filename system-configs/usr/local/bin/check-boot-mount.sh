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

# Check if the kernel logged a FAT32 dirty-bit warning for /boot at this boot.
# Linux's vfat driver mounts dirty FAT32 partitions anyway (no error), but logs a
# specific warning. Writing to a dirty FAT32 partition causes filesystem corruption.
# Note: fsck.fat -n is not used here because Linux sets the dirty bit itself on RW
# mount, making it unreliable for detecting Windows-induced dirty state.
BOOT_DEV=$(findmnt -n -o SOURCE /boot)
BOOT_DEV_SHORT=$(basename "$BOOT_DEV")

if dmesg | grep -q "FAT-fs ($BOOT_DEV_SHORT).*not properly unmounted"; then
	echo "CRITICAL: /boot ($BOOT_DEV) was NOT cleanly unmounted before this boot!"
	echo "Windows left the FAT32 EFI partition dirty (Fast Startup or incomplete shutdown)."
	echo ""
	echo "Fix options:"
	echo "  1. Boot Windows → full Shutdown (not Restart) → reboot to Linux, then retry."
	echo "  2. Repair now:  umount /boot && fsck.fat -a $BOOT_DEV && mount /boot"
	echo "     Then re-run your pacman command."
	exit 1
fi

exit 0
