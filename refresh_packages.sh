#!/bin/bash

echo "Updating pacman list (pkglist.txt)"
pacman -Qqe > $HOME/dotfiles/pkglist.txt

echo "Updating yay list (aurlist.txt)"
yay -Qqe > $HOME/dotfiles/aurlist.txt
