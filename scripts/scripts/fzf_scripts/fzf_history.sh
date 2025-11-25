#!/bin/bash

# tac: cat but reverse order
# sed: get rid of the beginning syntax bs
# awk: remove duplicates
# pass into fzf
cmd="$(tac $ZSH/cache/.zsh_history | sed 's/^.*;//' | awk '!a[$0]++' | fzf --height 60%)"

# check if command exists and then run in zsh
[ -n "$cmd" ] && zsh -i -c "$cmd"
