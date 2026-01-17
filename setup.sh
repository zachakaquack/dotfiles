#!/usr/bin/env bash

# startup checks
if ! [ $(id -u) = 0 ]; then
   echo "the script must run as sudo!!!!" >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

fake_home="/home/$real_user"
start="$(pwd)"
cd "$fake_home"

notify(){
    local msg
    msg=$1

    # notify-send unfortunately does not work with sudo so
    # i have to comment it out
    # notify-send "$msg"
    echo -e "$msg"
}

startup(){
    pacman -Syu --needed git base-devel
}

install_packages(){
    yay -S --noconfirm --needed - < "$start/pkglist.txt"
}

install_yay(){
    rm -rf "$fake_home/yay"
    sudo -u "$real_user" git clone https://aur.archlinux.org/yay.git "$fake_home/yay"
    cd "$fake_home/yay"

    echo -e "\n\n\n\n\n\n\n\n\n\n"
    echo "Please run 'makepkg -si' in '$fake_home/yay' before continuing"
    echo "type 'y' to continue"

    while true; do
	read -s -n 1 key
	case "$key" in 
	    "y") break ;;
	    "*") continue ;;
	esac
    done

    rm -rf "$fake_home/yay"
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
