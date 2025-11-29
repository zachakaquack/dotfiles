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
    notify-send "Done backing up dotfiles"
}

options="Theme Menu""\\n"
options+="Calculator""\\n"
options+="Backup Dotfiles""\\n"

chooseprogram() { \
        choice=$(printf "$options" | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_menu_picker")
    case "$choice" in
        "Theme Menu") themes ;;
        "Calculator") calculator ;;
        "Backup Dotfiles") backupdotfiles ;;
    esac
}

chooseprogram
