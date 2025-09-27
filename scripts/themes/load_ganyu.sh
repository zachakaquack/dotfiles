#!/bin/bash
wal -n -i ~/Pictures/bgs/ganyu.jpg
waypaper --wallpaper ~/Pictures/bgs/ganyu.jpg
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
