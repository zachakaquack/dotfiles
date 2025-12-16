#!/bin/bash
# inspired by bread on penguin's
# "bash scripting into dmenu to improve workflow and solve problems"
# https://youtu.be/h_E3ddNQ1xw

themes() { \
        $HOME/scripts/fzf_scripts/fzf_theme_menu.sh
}

calculator() { \
        $HOME/scripts/calculator.sh "fzf_calculator"
}

backupdotfiles() { \
        $HOME/dotfiles/backup.sh
}

projects(){
    $HOME/scripts/fzf_scripts/find_projects.sh "$1"
}

twitter(){
    gtk-launch WebApp-twitter3005.desktop
}

get_date(){
    d=$(date)
    wl-copy $d
    notify-send "Copied $d"
}

run_dysk(){
    foot --app-id "fzf_dysk" sh -c "cat ~/.cache/wal/sequences; dysk; echo; read -n 1 _" &
}

run_speedtest(){
    foot --app-id "fzf_speedtest" sh -c "cat ~/.cache/wal/sequences; speedtest++; echo; read -n 1 _" &
}

run_minecraft(){
    prismlauncher --launch MCSRRanked-Linux-1.16.1-All & disown
}

run_rhythia(){
    $HOME/Desktop/Rhythia/SoundSpacePlus.x86_64
}

run_mission_center(){
    missioncenter &
}

random_theme(){
    image=$(find $HOME/Pictures/bgs | shuf -n 1)
    $HOME/scripts/wal-tile.sh $image
}

attach_tmux(){
    $HOME/scripts/fzf_scripts/fzf_tmux_attach.sh
}

options="Theme Menu""\\n"
options+="Calculator""\\n"
options+="Backup Dotfiles""\\n"
options+="Search Python Projects""\\n"
options+="Search C++ Projects (CPP)""\\n"
options+="Search Repos""\\n"
options+="Twitter""\\n"
options+="Dysk (Disk)""\\n"
options+="SpeedTest""\\n"
options+="Minecraft (MCSR)""\\n"
options+="Rhythia""\\n"
options+="Mission Center (Task Manager)""\\n"
options+="Random Theme""\\n"
options+="Attach TMUX""\\n"

chooseprogram() { \
        d=$(date)
    choice=$($HOME/scripts/fzf_scripts/fzfmenu.sh "$d\n$options")
    case "$choice" in
        "Theme Menu") themes ;;
        "Calculator") calculator ;;
        "Backup Dotfiles") backupdotfiles ;;
        "Search Python Projects") projects "python" ;;
        "Search C++ Projects (CPP)") projects "c++" ;;
        "Search Repos") projects "repos" ;;
        "Twitter") twitter ;;
        "Dysk (Disk)") run_dysk ;;
        $d) get_date ;;
        "SpeedTest") run_speedtest ;;
        "Minecraft (MCSR)") run_minecraft ;;
        "Rhythia") run_rhythia ;;
        "Mission Center (Task Manager)") run_mission_center ;;
        "Random Theme") random_theme ;;
        "Attach TMUX") attach_tmux ;;
    esac
}

chooseprogram
