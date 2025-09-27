#!/bin/bash
wal -n -i ~/Pictures/bgs/adachi.jpeg
waypaper --wallpaper ~/Pictures/bgs/adachi.jpeg
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
