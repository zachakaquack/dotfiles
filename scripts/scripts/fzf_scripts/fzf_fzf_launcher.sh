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
        id=$(notify-send -p "Backing up dotfiles...")
    $HOME/dotfiles/backup.sh

    # expire in 3 seconds
    notify-send -t 3000 -r $id "Done backing up dotfiles!"
}

projects(){
    $HOME/scripts/fzf_scripts/find_projects.sh "$1"
}

options="Theme Menu""\\n"
options+="Calculator""\\n"
options+="Backup Dotfiles""\\n"
options+="Search Python Projects""\\n"
options+="Search C++ Projects (CPP)""\\n"
options+="Search Repos""\\n"

chooseprogram() { \
        choice=$(printf "$options" | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_menu_picker")
    case "$choice" in
        "Theme Menu") themes ;;
        "Calculator") calculator ;;
        "Backup Dotfiles") backupdotfiles ;;
        "Search Python Projects") projects "python" ;;
        "Search C++ Projects (CPP)") projects "c++" ;;
        "Search Repos") projects "repos" ;;
    esac
}

chooseprogram
