#!/bin/bash

directory="$HOME/Pictures/bgs/"

# list without directories
theme=$($HOME/scripts/fzf_scripts/menu.sh "$(ls -1 $directory)")

# only execute theme not empty
if [ -n "$theme" ]; then
    $HOME/scripts/wal-tile.sh $directory$theme
fi
