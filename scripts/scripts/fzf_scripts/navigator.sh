#!/bin/bash

cwd="$HOME"

echo_ls_command(){
    ls "$cwd" -1 -a -p --group-directories-first
}

open_menu(){
    command=$1

    item=$($SCRIPTS/fzf_scripts/menu.sh "$command")
    [[ -z "$item" ]] && exit

    [[ -d "$cwd$item" ]] && change_directory "$item" && exit

    # selected item is a file now
    open_kitty "$cwd" "$item"
}

open_kitty(){
    directory=$1
    filename=$2
    kitty --directory "$directory" sh -c "cat $HOME/.cache/wal/sequences; nvim "$filename"; exec \$SHELL" &
}

change_directory(){
    new_dir=$1
    cwd="$cwd$new_dir"
    open_menu "$(echo_ls_command)"
}

# init run
open_menu "$(echo_ls_command)"
