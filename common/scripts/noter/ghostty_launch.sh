#!/usr/bin/env bash

# colors
(cat $HOME/.cache/wal/sequences &)
cd "$(dirname $1)"

# actual process
nvim "$(basename $1)"

# nvim process is done, backup to github

id=$(notify-send -p "Adding...")
git add .

notify-send -r $id "Committing..."
git commit -m "update $(date -u +%Y-%m-%dT%H:%M:%S%Z)"

notify-send -r $id -t 100000 "Pushing..."
git push

notify-send -r $id -t 1000 "Done!"
