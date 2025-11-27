#!/bin/bash

# move so the git repo works
cd $HOME/dotfiles/

# refresh the package list
echo "updating pacman list (pkglist.txt)"
pacman -Qqe > $HOME/dotfiles/pkglist.txt

echo "updating yay list (aurlist.txt)"
yay -Qqe > $HOME/dotfiles/aurlist.txt

# do git stuff
git add . > /dev/null 2>&1

echo "updating..."
git commit -m "update $(date -u +%Y-%m-%dT%H:%M:%S%Z)" || true
git push > /dev/null 2>&1
echo "done"
