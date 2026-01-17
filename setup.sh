#!/usr/bin/env bash

notify-send "running Syu"
sudo pacman -Syu --needed git base-devel

notify-send "WARNING: READ CONSOLE"
echo -e "\nthese dotfiles have nvidia shit in them! if you want to remove them, make sure to remove them from \`pkglist.txt\`.\nthere are also some things from git that take a while to build, like nomacs.\ncontinuing the setup in 10 seconds."
sleep 10

if [[ ! -d "$HOME/yay" ]]; then 
    notify-send "downloading yay"
    git clone https://aur.archlinux.org/yay.git "$HOME/yay"
    cd "$HOME/yay"
    notify-send "building yay"
    makepkg -si
else
    notify-send "yay already downloaded"
fi

# yay stuff
notify-send "downloading packages from yay"
yay -S --noconfirm --needed - < "pkglist.txt"

# git stuff
echo "running oh-my-zsh installer in 3 sec..."
sleep 3

notify-send "running oh-my-zsh installer"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "running powerlevel10k in 3 sec..."
sleep 3

notify-send "installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

ls -p -1 | rg '/' | xargs -I {} stow -R {}

notify-send "finished"
echo -e "\nfinished, check stout for errors though"
