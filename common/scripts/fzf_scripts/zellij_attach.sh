#!/usr/bin/env bash

sessions=$(zellij ls -nrs)
session=$($SCRIPTS/fzf_scripts/menu.sh "$sessions")

# only execute session not empty
if [ -n "$session" ]; then
    foot sh -c "cat ~/.cache/wal/sequences; zellij a '$session'; exec \$SHELL"
fi
