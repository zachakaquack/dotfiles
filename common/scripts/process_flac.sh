#!/usr/bin/env bash

mkdir 16_bit

for f in *.flac;
do
    notify-send -t 1000 "Processing $f"
    ffmpeg -i "$f" -sample_fmt s16 -ar 48000 "16_bit/${f%.flac}.flac"
done
