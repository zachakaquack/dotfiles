#!/bin/bash

directory="$HOME/Pictures/bgs/"

# list without directories
list=$(ls -p $directory | grep -v /)

# image preview
fzfargs="--preview='clear && viu -t $directory{}'"
theme=$(basename -- "$list" ".${list##*.}" | $HOME/scripts/fzf_scripts/fzfmenu.sh $fzfargs)

# only execute theme not empty
if [ -n "$theme" ]; then
    $HOME/scripts/wal-tile.sh $directory$theme
fi
