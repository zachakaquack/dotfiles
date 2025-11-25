#!/bin/bash

# kitty --class "floating_kitty" sh -c "cat ~/.cache/wal/sequences && fzf --height 100% $* < /proc/$$/fd/0 > /proc/$$/fd/1"
foot --app-id "floating_kitty" sh -c "cat ~/.cache/wal/sequences && fzf --height 100% $* < /proc/$$/fd/0 > /proc/$$/fd/1" > /dev/null
