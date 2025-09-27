#!/bin/bash
wal -i /home/zach/Pictures/bgs/rain.jpeg
waypaper --wallpaper /home/zach/Pictures/bgs/rain.jpeg
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
