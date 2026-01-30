#!/usr/bin/env bash

BACKGROUNDS_DIR="$HOME/Pictures/bgs/"
random(){
    local image
    image=$(ls -1 "$BACKGROUNDS_DIR" |  shuf -n 1)
    $SCRIPTS/wal-tile.sh "$BACKGROUNDS_DIR$image"
}

open_menu(){
    local result
    local current

    current=$(swww query | awk '{print $NF}' | head -n 1 | xargs basename)
    result=$(echo -e "Again\nCurrent: $current" | fuzzel -d -l 2)

    [[ ! "$result" == "Again" ]] && exit

    random
    open_menu
}

random
open_menu
