#!/bin/bash
wal -i /home/zach/Pictures/bgs/jungle.jpeg
waypaper --wallpaper /home/zach/Pictures/bgs/jungle.jpeg
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
