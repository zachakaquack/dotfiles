#!/bin/bash

cwd="${1:-$HOME}"

while true; do

    command=$(ls "$cwd" -1 -a -p --group-directories-first)
    item=$($SCRIPTS/fzf_scripts/menu.sh "$command")
    [[ -z "$item" ]] && exit 0

    path=$(readlink -m "$cwd/$item")

    if [[ -d "$path" ]]; then

        echo "$path"
        if [[ "$path" = "$cwd" ]]; then
            kitty --directory "$cwd" sh -c "cat $HOME/.cache/wal/sequences; exec \$SHELL" &
            exit 0
        fi

        cwd=$path
        continue
    fi

    mime_type=$(file -b --mime-type "$path")

    if [[ "$mime_type" == text/* ]]; then
        kitty --directory "$cwd" sh -c "cat $HOME/.cache/wal/sequences; nvim \"$path\"; exec \$SHELL" &
    else
        xdg-open "$path" >/dev/null 2>&1 &
    fi
    exit 0

done
