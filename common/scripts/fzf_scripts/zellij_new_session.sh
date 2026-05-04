#!/usr/bin/env bash

name=$(fuzzel -d -p "name: > " -l 0 <<<"")

# only execute session not empty
if [ -n "$name" ]; then
    foot sh -c "cat ~/.cache/wal/sequences; zellij -s '$name'; exec \$SHELL"
fi
