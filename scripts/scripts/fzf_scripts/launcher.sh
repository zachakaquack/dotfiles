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

random_theme(){
    $SCRIPTS/random.sh
    # image=$(find $HOME/Pictures/bgs | shuf -n 1)
    # $SCRIPTS/wal-tile.sh $image
}


options="Theme Menu""\\n"
options+="Calculator""\\n"
options+="Backup Dotfiles""\\n"
options+="Search Python Projects""\\n"
options+="Search C++ Projects (CPP)""\\n"
options+="Search Repos""\\n"
# options+="Twitter""\\n"
# options+="Dysk (Disk)""\\n"
# options+="SpeedTest""\\n"
options+="Minecraft (MCSR)""\\n"
# options+="Mission Center (Task Manager)""\\n"
options+="Random Theme""\\n"
options+="Attach Zellij Session""\\n"
options+="New Zellij Session""\\n"
options+="Define Word""\\n"
# options+="Navigate / Open File""\\n"

chooseprogram() { \
        d=$(date)
    choice=$($SCRIPTS/fzf_scripts/menu.sh "$d\n$options")
    case "$choice" in
        "Theme Menu") themes ;;
        "Calculator") calculator ;;
        "Backup Dotfiles") backupdotfiles ;;
        "Search Python Projects") projects "python" ;;
        "Search C++ Projects (CPP)") projects "c++" ;;
        "Search Repos") projects "repos" ;;
            # "Twitter") twitter ;;
            # "Dysk (Disk)") run_dysk ;;
        $d) get_date ;;
            # "SpeedTest") run_speedtest ;;
        "Minecraft (MCSR)") run_minecraft ;;
            # "Mission Center (Task Manager)") missioncenter & ;;
        "Random Theme") random_theme ;;
        "Attach Zellij Session") $SCRIPTS/fzf_scripts/zellij_attach.sh ;;
        "New Zellij Session") $SCRIPTS/fzf_scripts/zellij_new_session.sh ;;
        "Define Word") $SCRIPTS/fzf_scripts/define_menu.sh ;;
            # "Navigate / Open File") $SCRIPTS/fzf_scripts/navigator.sh ;;
    esac
}

chooseprogram
