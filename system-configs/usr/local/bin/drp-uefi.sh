#!/bin/bash
# DRP (Disaster Recovery Plan)
# Protecting GRUB from Windows Update
# Uses a UEFI fallback path

EFI_DIR="/boot/EFI"
GRUB_BIN="$EFI_DIR/ArchLinux/grubx64.efi"
BOOT_DIR="$EFI_DIR/BOOT"
FALLBACK_BIN="$BOOT_DIR/BOOTX64.EFI"

echo "Running DRP (UEFI Fallback)..."

# 1. Prerequisite validation
if [ ! -f "$GRUB_BIN" ]; then
    echo "Fail: Can't find GRUB binary in $GRUB_BIN."
    echo "Check if your EFI partition is correctly mounted."
    exit 1
fi

# 2. Ensuring the UEFI standard fallback directory exists
echo "Ensuring fallback directory exists ($BOOT_DIR)..."
sudo mkdir -p "$BOOT_DIR"

# 3. Copying the binary to the fail-safe path
echo "Injecting GRUB into the motherboard's rescue path..."
sudo cp "$GRUB_BIN" "$FALLBACK_BIN"

# 4. Setting appropriate permissions (FAT32/EFI)
echo "Setting appropriate permissions..."
sudo chmod 755 "$FALLBACK_BIN"

echo ""
echo "Success! Boot infrastructure is now bulletproof."
echo "If Windows wipes the NVRAM, the motherboard will boot from BOOTX64.EFI."
