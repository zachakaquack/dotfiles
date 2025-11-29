#!/bin/bash

app_id=$1

# only args remaining are the fzf args
shift
foot --app-id "$app_id" sh -c "cat ~/.cache/wal/sequences && fzf --height 100% $* < /proc/$$/fd/0 > /proc/$$/fd/1" > /dev/null
