#!/usr/bin/env bash

start="$(pwd)"
cd "$HOME"

notify(){
    local msg
    msg=$1

    notify-send "$msg"
    echo -e "$msg"
}

startup(){
    sudo pacman -Syu --needed git base-devel
}

install_packages(){
    yay -S --noconfirm --needed - < "$start/pkglist.txt"
}

install_yay(){
    git clone https://aur.archlinux.org/yay.git "$HOME/yay"
    cd "$HOME/yay"
    makepkg -si
    rm -rf "$HOME/yay"
}

setup_stow(){
    cd "$start"
    ls -p -1 $start | rg '/' | xargs -I {} stow -R {}
}

main(){
    notify "starting..."
    startup

    notify "finished updating, installing yay now"
    install_yay

    notify "finished installing yay, installing packages now"
    install_packages 

    notify "finished installing packages, setting up stow now"
    setup_stow

    notify "finished"
}

main
