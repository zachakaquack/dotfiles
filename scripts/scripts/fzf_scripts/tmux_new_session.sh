#!/usr/bin/env bash

new_session(){
    session=$1
    kitty sh -c "cat ~/.cache/wal/sequences; tmux new -s '$session'; exec \$SHELL" &
}

name=$(fuzzel -d -p "name: > " -l 0 <<<"")

if [ -n "$name" ]; then
    new_session "$name"
fi
