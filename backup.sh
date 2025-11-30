#!/bin/bash

# move so the git repo works
cd $HOME/dotfiles/

# refresh the package list
id=$(notify-send -p "updating pacman list (pkglist.txt)")
pacman -Qqe > $HOME/dotfiles/pkglist.txt

sleep 0.1
notify-send -r $id "updating pacman list (pkglist.txt)"
yay -Qqe > $HOME/dotfiles/aurlist.txt

# do git stuff

sleep 0.1
notify-send -r $id "adding"
git add . > /dev/null 2>&1

sleep 0.1
notify-send -r $id "updating"
git commit -m "update $(date -u +%Y-%m-%dT%H:%M:%S%Z)" || true
git push > /dev/null 2>&1
notify-send -t 3000 -r $id "Done backing up dotfiles!"
