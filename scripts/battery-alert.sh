#!/bin/bash

BATTERY_PATH="/sys/class/power_supply/BAT0/capacity"
THRESHOLD=30
STATE_FILE="/tmp/battery_alert_state"

# Initialize state
if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi

while true; do
    BATTERY=$(cat "$BATTERY_PATH")
    ALERT_STATE=$(cat "$STATE_FILE")

    if [ "$BATTERY" -le "$THRESHOLD" ] && [ "$ALERT_STATE" -eq 0 ]; then
        notify-send \
            -u critical \
            -t 0 \
            -i battery-caution \
            "Battery Critical" \
            "Battery is at ${BATTERY}%!" \
            --app-name="battery-alert"

        echo "1" > "$STATE_FILE"
    elif [ "$BATTERY" -gt "$THRESHOLD" ] && [ "$ALERT_STATE" -eq 1 ]; then
        echo "0" > "$STATE_FILE"
    fi

    sleep 30
done
