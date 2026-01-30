#!/usr/bin/env bash

# "$@" is the wallpaper path
wal -n -i "$1"
swww img "$1" --transition-type random --transition-step 255 --transition-fps 144
cp $HOME/.cache/wal/colors-hyprland.conf $HOME/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
pywalfox update
pkill waybar; waybar &
swaync-client --reload-css
ffmpeg -i $1 "$XDG_CONFIG_HOME/waywall/resources/background.png" &
