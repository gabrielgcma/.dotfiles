#!/bin/bash
# 🚀 Dunst Notification Showcase - Gruvbox Theme

echo "Sending showcase notifications..."

# 1. Standard Urgencies
notify-send -u low "Low Urgency" "This is a quiet, background notification (Gruvbox Gray)."
sleep 0.8
notify-send -u normal "Normal Urgency" "This is your standard professional notification (Gruvbox Cream)."
sleep 0.8
notify-send -u critical "Critical Urgency" "This stays until clicked! (Gruvbox Red/Yellow)."
sleep 0.8

# 2. Progress Bar
notify-send -h int:value:65 "System Progress" "Uploading dotfiles to work PC..."
sleep 0.8

# 3. With Icons
notify-send -i dialog-information "System Update" "New security patches applied successfully."
sleep 0.8

# 4. Long Body Text
notify-send "Engineering Workflow" "Your environment is now optimized with GNU Stow, direnv, and automated venv activation. Everything is synced and ready for portability."
sleep 0.8

# 5. Teams Simulation (Testing the new rules)
echo "Testing Teams (Desktop)..."
notify-send -a "Microsoft Teams" "Teams Desktop" "Should be normal urgency (Cream)."
sleep 0.8

echo "Testing teams (Linux app)..."
notify-send -a "teams" "Teams Linux" "Should be normal urgency (Cream)."
sleep 0.8

echo "Testing Teams (Web)..."
notify-send -a "Google Chrome" "New Message in Teams" "Should be normal urgency (Cream)."

echo "Done!"
