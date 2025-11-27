#!/bin/bash

# move so the git repo works
cd $HOME/dotfiles/

# refresh the package list
$HOME/dotfiles/refresh_packages.sh
echo "Finished updating package lists"

# do git stuff
git add . > /dev/null 2>&1

echo "Updating..."
git commit -m "update $(date -u +%Y-%m-%dT%H:%M:%S%Z)" || true
git push > /dev/null 2>&1
echo "Done"
