#!/usr/bin/env bash

# to use this, follow these steps:
# run this in your terminal (https://askubuntu.com/a/1121712):
# sudo awk -F\' '$1=="menuentry " || $1=="submenu " {print i++ " : " $2}; /\smenuentry / {print "\t" i-1">"j++ " : " $2};' /boot/grub/grub.cfg
# change this variable to windows:
WINDOWS_NUMBER=2

# then you can just run `sudo ./boot_into_windows.sh`
# if you want to run from scripts, you can do this (DANGEROUS!)
# run `sudo visudo`
# at the bottom, add this, but replace with the relevant info
# {USERNAME} ALL=(ALL) NOPASSWD: {path/to/script/boot_into_windows.sh}

# 2 = windows
grub-reboot "$WINDOWS_NUMBER"
/sbin/reboot
