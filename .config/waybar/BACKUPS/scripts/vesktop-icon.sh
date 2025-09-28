#!/bin/bash
STATE_FILE="$HOME/.config/swaync/.vesktop_blocked"
TOGGLE_SCRIPT="$HOME/.config/waybar/scripts/toggle_vesktop.sh"

# Ensure state file exists
if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi

if [ "$1" = "--toggle" ]; then
    # Call your existing toggle script
    "$TOGGLE_SCRIPT"

    # Tell Waybar to refresh this module immediately
    pkill -RTMIN+8 waybar   # make sure to use same signal as below
    exit 0
fi

# Read current state (0 = allowed, 1 = ignored)
STATE=$(cat "$STATE_FILE")

if [ "$STATE" -eq 1 ]; then
    echo " "   # icon text when notifications are blocked
else
    echo " "    # icon text when notifications are allowed
fi
