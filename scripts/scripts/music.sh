#!/usr/bin/env bash

selection=""
while true; do
    # all status variables
    current="$(mpc current)"
    is_paused="$(mpc | sed -n '2p' | awk '{print $1}' | sed 's/\[//g' | sed 's/\]//g')"
    settings="$(mpc | tail -n 1 | tr -s ' ')"
    is_repeat="$(echo "$settings" | awk '{print $4}')"
    is_random="$(echo "$settings" | awk '{print $6}')"
    is_single="$(echo "$settings" | awk '{print $8}')"
    # is_consume="$(echo "$settings" | awk '{print $10}')"

    # make them uppercase
    is_paused="${is_paused^^}"
    is_repeat="${is_repeat^^}"
    is_random="${is_random^^}"
    is_single="${is_single^^}"
    # is_consume="${is_consume^^}"

    # toggle the visual play / pause
    options=""
    toggle=""
    if [[ "$is_paused" == "PAUSED" ]]; then
        toggle="Play"
    else
        toggle="Pause"
    fi

    # all the options
    options+="$toggle""\n"
    options+="Volume Up +5%""\n"
    options+="Volume Down -5%""\n"
    options+="Repeat Album (currently $is_repeat)""\n"
    options+="Random Next Song (currently $is_random)""\n"
    options+="Repeat Song (currently $is_single)""\n"
    # options+="Consume Songs (currently $is_consume)""\n"
    options+="Shuffle List""\n"
    options+="Next Song""\n"
    options+="Previous Song""\n"
    options+="Restart Song"


    # keep in the same spot when toggling play and pause
    if [[ "$selection" == "Play" ]]; then
        selection="Pause"
    elif [[ "$selection" == "Pause" ]]; then
        selection="Play"
    fi

    # if first time launching, then go to play/pause button
    [[ -z "$selection" ]] && selection="$toggle"

    song="$current"
    [[ -z "$song" ]] && song="None Playing..."

    chosen="$(echo -e "$song\n$options" | fuzzel -d --select="$selection")"
    selection="$chosen"
    chosen="${chosen,,}"


    # choose the correct one
    case "$chosen" in
        "${song,,}" ) ghostty -e ncmpcpp && exit ;;
        "play" ) mpc play && exit ;;
        "pause" ) mpc pause && exit ;;
        *"+5"* ) mpc volume +5 && notify-send -t 500 "$(mpc volume | awk '{print $2}')" ;;
        *"-5"* ) mpc volume -5 && notify-send -t 500 "$(mpc volume | awk '{print $2}')" ;;
        "repeat album"* ) mpc repeat ;;
        "shuffle"* ) mpc shuffle ;;
        "repeat song"* ) mpc single ;;
            # "consume"* ) mpc consume ;;
        "random"* ) mpc random ;;
        "next song" ) mpc next && notify-send -t 3000 "Now Playing: $(mpc current)" ;;
        "previous song" ) mpc prev ;;
        "restart song" ) mpc seek 0% ;;
        *) echo "$chosen, $current" && exit ;;
    esac
done
