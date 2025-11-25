#!/bin/bash

# "$@" is the wallpaper path
wal -n -i "$@"
swww img "$@" --transition-type random --transition-step 255 --transition-fps 144
cp $HOME/.cache/wal/colors-hyprland.conf $HOME/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
pywalfox update
pkill waybar; waybar &
swaync-client --reload-css
