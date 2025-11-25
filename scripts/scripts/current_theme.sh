#!/bin/bash
current=$(swww query | awk '{print $NF}' | head -n 1)
text=" copied!"
notify_seconds=3


notify-send -t $(($notify_seconds*1000)) "$(echo $current$text)"
wl-copy $current
