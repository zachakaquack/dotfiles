#!/bin/bash
set -e

echo "installing base (pacman stuff)"
sudo pacman -S --needed - < pkglist.txt

echo "installing aur (yay stuff)"
yay -S --needed - < aurlist.txt

echo "applying dotfiles bullshit"
cd "$(dirname "$0")"
stow -R hypr kitty nvim wal waybar zsh

echo "donezo!!!!!"
