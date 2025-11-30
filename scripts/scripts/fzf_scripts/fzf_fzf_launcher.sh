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

launchfzf(){
    tmp=$(mktemp)
    find "$HOME" > "$tmp"
    choice=$($HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_menu" < "$tmp")
    rm "$tmp"

    # if made choice, go to the directory
    if [[ -n $choice ]]; then
        # if directory
        if [[ -d $choice ]]; then
            kitty --directory "$choice" &
        else
            dir=$(dirname $choice)
            file=$(basename $choice)
            kitty --directory "$dir" sh -c "nvim \"$file\"; exec \$SHELL" &
        fi
    fi
}

twitter(){
    gtk-launch WebApp-twitter3005.desktop
}

options="Theme Menu""\\n"
options+="Calculator""\\n"
options+="Backup Dotfiles""\\n"
options+="Search Python Projects""\\n"
options+="Search C++ Projects (CPP)""\\n"
options+="Search Repos""\\n"
options+="Search Scripts""\\n"
options+="FZF""\\n"
options+="Twitter""\\n"

chooseprogram() { \
        choice=$(printf "$options" | shuf | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_menu_picker")
    case "$choice" in
        "Theme Menu") themes ;;
        "Calculator") calculator ;;
        "Backup Dotfiles") backupdotfiles ;;
        "Search Python Projects") projects "python" ;;
        "Search C++ Projects (CPP)") projects "c++" ;;
        "Search Scripts") projects "scripts" ;;
        "Search Repos") projects "repos" ;;
        "FZF") launchfzf ;;
        "Twitter") twitter ;;
    esac
}

chooseprogram
