#!/bin/bash

app_id="fzf_tmux_attach"
session=$(tmux ls -F "#S" | $HOME/scripts/fzf_scripts/fzfmenu.sh "$app_id" )

# only execute session not empty
if [ -n "$session" ]; then
    kitty sh -c "cat ~/.cache/wal/sequences; tmux attach -t '$session'; exec \$SHELL" &
fi
