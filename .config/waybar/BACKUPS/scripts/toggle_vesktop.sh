#!/bin/bash

CONFIG="$HOME/.config/swaync/config.json"
STATE_FILE="$HOME/.config/swaync/.vesktop_blocked"

# Create state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" -eq 0 ]; then
    # Add/enable hide-vesktop
    jq '. + { "notification-visibility": { "hide-vesktop": { "app-name": "vesktop", "state": "ignored" } } }' \
       "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"

    swaync-client --reload-config
    echo "1" > "$STATE_FILE"
    notify-send -t 1000 "Notifications" "Vesktop notifications disabled"
else
    # Remove hide-vesktop
    jq 'del(.["notification-visibility"]["hide-vesktop"])
        | if .["notification-visibility"] == {} then del(.["notification-visibility"]) else . end' \
       "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"

    swaync-client --reload-config
    echo "0" > "$STATE_FILE"
    notify-send -t 1000 "Notifications" "Vesktop notifications enabled"
fi
