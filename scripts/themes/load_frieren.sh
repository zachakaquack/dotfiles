#!/bin/bash
wal -i /home/zach/Pictures/bgs/frieren.jpg
waypaper --wallpaper /home/zach/Pictures/bgs/frieren.jpg
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
