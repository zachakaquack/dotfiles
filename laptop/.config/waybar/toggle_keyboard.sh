#!/usr/bin/env bash

if pgrep -x "wvkbd-deskintl" > /dev/null; then
    pkill -x "wvkbd-deskintl"
else
    wvkbd-deskintl \
        --bg 11111b \
        --fg 313244 \
        --fg-sp 45475a \
        --press 89b4fa \
        --text cdd6f4 &
fi
