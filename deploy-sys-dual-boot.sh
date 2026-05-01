#!/bin/bash
# Deploy pipeline for system configs (root)
# (only when dual booting)

DOTFILES_SYS="$HOME/.dotfiles/system-configs"

echo "Starting system infrastructure deploy..."

# 1. Copies and protects the executables (chmod 755)
echo "-> Syncing local binaries"
sudo cp "$DOTFILES_SYS/usr/local/bin/"* /usr/local/bin/
sudo chown root:root /usr/local/bin/check-boot-mount.sh /usr/local/bin/drp-uefi.sh
sudo chmod 755 /usr/local/bin/check-boot-mount.sh /usr/local/bin/drp-uefi.sh

# 2. Copies and protects the Pacman hooks
echo "-> Syncing Pacman hooks"
sudo mkdir -p /etc/pacman.d/hooks
sudo cp "$DOTFILES_SYS/etc/pacman.d/hooks/"* /etc/pacman.d/hooks/
sudo chown root:root /etc/pacman.d/hooks/*.hook
sudo chmod 644 /etc/pacman.d/hooks/*.hook

echo ""
echo "Deploy finished! System files are updated and safe."
