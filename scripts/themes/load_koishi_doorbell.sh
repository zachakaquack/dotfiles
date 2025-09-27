#!/bin/bash
wal -i /home/zach/Pictures/bgs/koishi2.jpeg
waypaper --wallpaper /home/zach/Pictures/bgs/koishi2.jpeg
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
