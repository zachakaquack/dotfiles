#!/bin/bash

echo "updating pacman list"
pacman -Qqe > $HOME/dotfiles/pkglist.txt

echo "updating yay list"
yay -Qqe > $HOME/dotfiles/aurlist.txt
