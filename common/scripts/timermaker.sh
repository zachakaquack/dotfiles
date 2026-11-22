#!/usr/bin/env bash

# len(seconds)|message
TIMER_BACKLOG_FILE="$XDG_CACHE_HOME/previous_timers.txt"
[[ ! -f "$TIMER_BACKLOG_FILE" ]] && touch "$TIMER_BACKLOG_FILE"


# idk how to return 2 values from a function lol
get_seconds_from_timer() {
    echo "$1" | cut -d "|" -f 1
}

get_messsage_from_timer() {
    echo "$1" | cut -d "|" -f 2
}

write_new_timer_to_file() {
    local TEMP_TIMER_FILE="$XDG_CACHE_HOME/temp_previous_timers.txt"
    touch "$TEMP_TIMER_FILE"

    # skip if most recent timer is already the stuff we're trying to add
    [[ "$(head -n 1 "$TIMER_BACKLOG_FILE")" == $1 ]] && return

    while IFS= read -r line; do
        if [[ "$line" == "$1" ]]; then
            sed -i "1s;^;$line\n;" "$TEMP_TIMER_FILE"
        else
            echo "$line" >> "$TEMP_TIMER_FILE"
        fi
    done < "$TIMER_BACKLOG_FILE"

    # if we read through all lines of the old timer file, and nothing is changed, that means
    # the current line we are trying to insert is completely new, so we add
    if [[ "$(cat "$TEMP_TIMER_FILE")" == "$(cat "$TIMER_BACKLOG_FILE")" ]]; then
        echo "$1" >> "$TEMP_TIMER_FILE"
    fi

    mv "$TEMP_TIMER_FILE" "$TIMER_BACKLOG_FILE"
}

pretty_print_backlog_file() {
    local seconds message full
    while IFS= read -r line; do
        seconds="$(get_seconds_from_timer "$line")"
        message="$(get_messsage_from_timer "$line")"

        full+="$(date -d@$seconds -u +%H:%M:%S)"
        full+=", $message\n"

    done < "$TIMER_BACKLOG_FILE"
    echo -e "$full"
}

fuzzel_prompt_text() {
    pretty_print_backlog_file | fuzzel -d --prompt "Enter Time or Choose Existing: "
}

timestamp_to_seconds() {
    echo "$1" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'
}

start_timer() {
    sleep "$1" && notify-send "$message"
}

main() {
    local fuzzel_choice
    local seconds message combined

    fuzzel_choice="$(fuzzel_prompt_text)"
    case "$fuzzel_choice" in
        "") # no option chosen
            return 1
            ;;
        *","*) # premade option
            seconds="$(echo "$fuzzel_choice" | cut -d "," -f 1)"
            seconds="$(timestamp_to_seconds "$seconds")"
            message="$(echo "$fuzzel_choice" | cut -d "," -f 2-)"
            combined="$seconds$message"
            combined="$(echo "$combined" | sed 's/ /|/')"
            ;;
        *) # make your own
            fuzzel_choice="$(echo "$fuzzel_choice" | sed 's/ //g' | sed 's/\.//g')"
            if [[ ! "$fuzzel_choice" =~ ^[0-9]+$ ]]; then
                notify-send "Invalid length of the timer!"
                return 1
            fi

            seconds="$fuzzel_choice"
            message="$(fuzzel -d --prompt-only "Enter message: ")"
            combined="$fuzzel_choice|$message"
            ;;
    esac

    write_new_timer_to_file "$combined"
    start_timer "$seconds" "$message"

}

main
