#!/bin/bash

# move so the git repo works
cd $HOME/dotfiles/

# refresh the package list
$HOME/dotfiles/refresh_packages.sh

echo "finished updating package lists"

# actually push
echo "adding to git"
git add .

echo "committing"
git commit -m "update" || true

echo "pushing"
git push
