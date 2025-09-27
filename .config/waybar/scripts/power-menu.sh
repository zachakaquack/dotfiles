#!/usr/bin/env bash

# Define power menu options
options="Lock\nShutdown\nReboot\nLogout\nHibernate\nSuspend"

# Show Wofi menu and get user selection
choice=$(echo -e "$options" | wofi --dmenu --width 250 --height 300 --prompt "Power")

# Exit if nothing selected
[[ -z "$choice" ]] && exit 0

# Handle user selection
case "$choice" in
  Lock) loginctl lock-session ;;
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Logout) loginctl terminate-user "$USER" ;;
  Hibernate) systemctl hibernate ;;
  Suspend) systemctl suspend ;;
esac
