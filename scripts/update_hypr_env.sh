#!/bin/bash

# Wait up to 10 seconds for Hyprland to appear
for i in {1..10}; do
    HYPR_PID=$(pgrep -u zach -f Hyprland)
    if [[ -n "$HYPR_PID" ]]; then
        break
    fi
    sleep 1
done

# Double-check that we have a valid PID
if [[ -z "$HYPR_PID" ]]; then
    echo "Hyprland not running after 10 seconds"
    exit 1
fi

# Extract the environment variable from the process
HYPR_SIGNATURE=$(tr '\0' '\n' < /proc/"$HYPR_PID"/environ | grep HYPRLAND_INSTANCE_SIGNATURE | cut -d= -f2-)

# If signature is still empty, fail clearly
if [[ -z "$HYPR_SIGNATURE" ]]; then
    echo "HYPRLAND_INSTANCE_SIGNATURE not found in process environment"
    exit 2
fi

# Write the environment file
echo "export DISPLAY=:0" > /home/zach/.hypr_env
echo "export XDG_RUNTIME_DIR=/run/user/1000" >> /home/zach/.hypr_env
echo "export HYPRLAND_INSTANCE_SIGNATURE=$HYPR_SIGNATURE" >> /home/zach/.hypr_env

echo "Wrote hypr env to ~/.hypr_env"
