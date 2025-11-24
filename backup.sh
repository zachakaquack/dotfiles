#!/bin/bash

# move so the git repo works
cd $HOME/dotfiles/

# refresh the package list
$HOME/dotfiles/refresh_packages.sh
echo "Finished updating package lists"

# do git stuff
git add . > /dev/null 2>&1
git commit -m "update" > /dev/null 2>&1 || true
git push > /dev/null 2>&1
echo "Done"
