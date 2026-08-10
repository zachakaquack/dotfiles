#!/usr/bin/env bash

query="$(fuzzel -d --prompt-only "Search: ")"

# get output of python
cd $HOME/college/
options="$(python $HOME/college/search.py "$query")"
[[ -z "$options" ]] && notify-send "No results..." && exit 0

choice="$(fuzzel -d <<<$(echo -e "$options"))"

[[ -z "$choice" ]] && exit 0
fullpath="$HOME/college/$choice"
$HOME/kritadev/install/bin/krita "$fullpath"
