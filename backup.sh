#!/bin/bash

# move so the git repo works
cd $HOME/dotfiles/

# refresh the package list
$HOME/dotfiles/refresh_packages.sh
echo "finished updating package lists"

# do git stuff
git add . > /dev/null
git commit -m "update" || true > /dev/null
git push > /dev/null
