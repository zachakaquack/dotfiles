#!/bin/bash

session=$($SCRIPTS/fzf_scripts/menu.sh "$(printf "$(tmux ls -F "#S")")")

# only execute session not empty
if [ -n "$session" ]; then
    kitty sh -c "cat ~/.cache/wal/sequences; tmux attach -t '$session'; exec \$SHELL" &
fi
