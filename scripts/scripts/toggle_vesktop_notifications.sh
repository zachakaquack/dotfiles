#!/usr/bin/env bash

CONFIG_HOME="$XDG_CONFIG_HOME/swaync/config.json"
STATE_PATH='."notification-visibility"."vesktop-blocker".state'

ENABLED="\"enabled\""
MUTED="\"muted\""

turn_on_notifs(){
    cat <<< $(jq  "$STATE_PATH = $ENABLED" "$CONFIG_HOME") > "$CONFIG_HOME"
    swaync-client --reload-config
    notify-send --app-name "vesktop" -t 1000 "Notifications Enabled!"
}

turn_off_notifs(){
    cat <<< $(jq  "$STATE_PATH = $MUTED" "$CONFIG_HOME") > "$CONFIG_HOME"
    notify-send --app-name "vesktop" -t 1000 "Notifications Disabled!"
    swaync-client --reload-config
}

toggle(){
    local state
    state=$(jq  "$STATE_PATH" "$CONFIG_HOME")
    if [[ "$state" == "$ENABLED" ]]; then
        turn_off_notifs
    else
        turn_on_notifs
    fi
}
