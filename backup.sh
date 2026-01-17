#!/bin/bash

# move so the git repo works
cd $HOME/dotfiles/

# refresh the package list
id=$(notify-send -p "Updating YAY list...")
yay -Qqe > $HOME/dotfiles/pkglist.txt

# do git stuff

notify-send -r $id "Adding files..."
git add . > /dev/null 2>&1

notify-send -r $id "Committing..."
git commit -m "update $(date -u +%Y-%m-%dT%H:%M:%S%Z)" || true
git push > /dev/null 2>&1
notify-send -t 3000 -r $id "Done backing up dotfiles!"
