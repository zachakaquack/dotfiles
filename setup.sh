#!/bin/bash
set -e

yay -S --needed - < aurlist.txt

echo "applying dotfiles bullshit"
cd "$(dirname "$0")"

dirs=$(./get_dirs.sh)
echo "setting up for: $dirs"
stow -R "$dirs"
echo "donezo!!!!!"
