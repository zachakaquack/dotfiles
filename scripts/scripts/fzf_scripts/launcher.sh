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


options="Theme Menu""\\n"
options+="Calculator""\\n"
options+="Backup Dotfiles""\\n"
# options+="Search Python Projects""\\n"
# options+="Search C++ Projects (CPP)""\\n"
# options+="Search Repos""\\n"
options+="Minecraft (MCSR)""\\n"
options+="Random Theme""\\n"
options+="Define Word""\\n"
options+="Notes""\\n"

chooseprogram() { \
        d=$(date)
    choice=$($SCRIPTS/fzf_scripts/menu.sh "$d\n$options")
    case "$choice" in
        "Theme Menu") themes ;;
        "Calculator") calculator ;;
        "Backup Dotfiles") backupdotfiles ;;
            # "Search Python Projects") projects "python" ;;
            # "Search C++ Projects (CPP)") projects "c++" ;;
            # "Search Repos") projects "repos" ;;
        $d) get_date ;;
        "Minecraft (MCSR)") run_minecraft ;;
        "Random Theme") random_theme ;;
        "Define Word") $SCRIPTS/fzf_scripts/define_menu.sh ;;
        "Notes") $SCRIPTS/noter/main.sh ;;
    esac
}

chooseprogram
