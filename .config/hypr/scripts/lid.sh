#!/bin/bash

if grep -q open /proc/acpi/button/lid/LID0/state; then
  # Lid opened - do nothing or turn screen on
  hyprctl dispatch dpms on
else
  # Lid closed - lock and turn screen off
  hyprlock
  sleep 1
  hyprctl dispatch dpms off
fi
