#!/bin/bash

SOURCE_DIR="/home/zach/Pictures/top"
DEST_DIR="$SOURCE_DIR/converted"

mkdir -p "$DEST_DIR"

shopt -s nullglob nocaseglob
for img in "$SOURCE_DIR"/*.{jpg,jpeg,webp,bmp,tiff}; do
    filename=$(basename "$img")
    name="${filename%.*}"
    output="$DEST_DIR/${name}.png"

    echo "Converting: $img -> $output"
    magick "$img" "$output"
done

echo "✅ Done converting images to PNG."
