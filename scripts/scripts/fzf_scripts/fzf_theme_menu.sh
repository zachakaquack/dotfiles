#!/bin/bash

directory="$HOME/Pictures/bgs/"

# list without directories
list=$(ls -p $directory | grep -v /)

# image preview
app_id="fzf_theme_menu"
fzfargs="--preview='clear && viu -t -w 50 $directory{}'"
theme=$(basename -- "$list" ".${list##*.}" | $HOME/scripts/fzf_scripts/fzfmenu.sh "$app_id" $fzfargs)

# only execute theme not empty
if [ -n "$theme" ]; then
    $HOME/scripts/wal-tile.sh $directory$theme
fi
