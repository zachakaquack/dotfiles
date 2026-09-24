#!/usr/bin/env bash

directory="$HOME/Pictures/bgs"

# list without directories
theme=$($SCRIPTS/fzf_scripts/menu.sh "$(ls -1t $directory)")

# only execute theme not empty
if [[ -n "$theme" ]]; then
    $SCRIPTS/wal-tile.sh "$directory/$theme"
fi
