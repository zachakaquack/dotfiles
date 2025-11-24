#!/bin/bash

# move so the git repo works
cd $HOME/dotfiles/

# refresh the package list
$HOME/dotfiles/refresh_packages.sh
echo "finished updating package lists"

# do git stuff
git add .
git commit -m "update" || true
git push
