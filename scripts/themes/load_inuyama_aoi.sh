#!/bin/bash
wal -n -i ~/Pictures/bgs/inuyamaaoi1.jpg
waypaper --wallpaper ~/Pictures/bgs/inuyamaaoi1.jpg
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors.conf && hyprctl reload
pywal-discord -t default
