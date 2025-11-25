#!/bin/bash

current="$HOME"
while true; do
    file=$(fd . -d 1 -u --base-directory $current | $HOME/scripts/fzf_scripts/fzfmenu.sh)

    # if is directory
    if [ -d "$current/$file" ] ; then
        current="$current/$file"
    else
        break
    fi
done
