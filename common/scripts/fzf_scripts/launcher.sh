#!/usr/bin/env bash
# inspired by bread on penguin's
# "bash scripting into dmenu to improve workflow and solve problems"
# https://youtu.be/h_E3ddNQ1xw

themes() { \
        $SCRIPTS/fzf_scripts/theme_menu.sh
}

calculator() { \
        $SCRIPTS/calculator.sh "fzf_calculator"
}

backupdotfiles() { \
        $HOME/dotfiles/backup.sh
}

projects(){
    $SCRIPTS/fzf_scripts/find_projects.sh "$1"
}

get_date(){
    d=$(date)
    wl-copy $d
    notify-send "Copied $d"
}

run_minecraft(){
    prismlauncher --launch MCSRRanked-Linux-1.16.1-All & disown
}

random_theme(){
    $SCRIPTS/random.sh
}

toggle_vesktop_notifications(){
    source $SCRIPTS/toggle_vesktop_notifications.sh
    toggle
}

get_vesktop_status_str(){
    source $SCRIPTS/toggle_vesktop_notifications.sh

    local state
    state=$(jq  "$STATE_PATH" "$CONFIG_HOME")

    if [[ "$state" == "$ENABLED" ]]; then
        echo "Disable Vesktop Notifications"
    else
        echo "Enable Vesktop Notifications"
    fi
}

options="Theme Menu""\\n"
options+="Calculator""\\n"
options+="Backup Dotfiles""\\n"
options+="Random Theme""\\n"
options+="Define Word""\\n"
options+="Notes""\\n"
options+="Music Controls""\\n"
options+="Youtube Downloader""\\n"
options+="$(get_vesktop_status_str)""\\n"
options+="ncmpcpp""\\n"

chooseprogram() { \
        d=$(date)
    choice=$($SCRIPTS/fzf_scripts/menu.sh "$d\n$options")
    case "$choice" in
        "Theme Menu") themes ;;
        "Calculator") calculator ;;
        "Backup Dotfiles") backupdotfiles ;;
        $d) get_date ;;
        "Random Theme") random_theme ;;
        "Define Word") $SCRIPTS/fzf_scripts/define_menu.sh ;;
        "Notes") $SCRIPTS/noter/main.sh ;;
        "Music Controls") $SCRIPTS/music.sh ;;
        "Youtube Downloader") $SCRIPTS/ytdownloader.sh ;;
        *"Vesktop Notifications") toggle_vesktop_notifications ;;
        "ncmpcpp") "$SCRIPTS/ncmpcpp.sh" ;;
    esac
}

chooseprogram
