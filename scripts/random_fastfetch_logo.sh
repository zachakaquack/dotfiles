#!/bin/bash

logo_dir="/home/zach/Pictures/top"
config_path="$HOME/.config/fastfetch/config.jsonc"
backup_path="${config_path}.bak"

# Only use PNGs (Kitty doesn't support JPGs)
mapfile -t images < <(find "$logo_dir" -type f -iname "*.png")

if [[ ${#images[@]} -eq 0 ]]; then
    echo "❌ No PNG images found in $logo_dir"
    exit 1
fi

# Pick a random image
image="${images[RANDOM % ${#images[@]}]}"

# Create a temporary filename for resized image
resized_image="/tmp/fastfetch_logo_resized_$$.png"

# Resize while maintaining aspect ratio:
# - Max width 400px OR max height 200px
# ImageMagick syntax: resize with geometry "400x200>" means resize only if bigger than 400x200, keeping aspect ratio
magick "$image" -filter Lanczos -define filter:support=6 -resize 1600x800\> -unsharp 0x1 "$resized_image"

# Escape path for JSON
escaped_path="${resized_image//\\/\\\\}"

# Ensure config exists
if [[ ! -f "$config_path" ]]; then
    echo "❌ Config file not found: $config_path"
    exit 1
fi

# Back it up
cp "$config_path" "$backup_path"

# Replace the line with "source": "..."
new_config=$(sed -E "s|(\"source\"[[:space:]]*:[[:space:]]*\").*?(\")|\1$escaped_path\2|" "$config_path")

# Write only if changed
if [[ "$new_config" != "$(cat "$config_path")" ]]; then
    echo "$new_config" > "$config_path"
    echo "✅ Fastfetch logo updated to resized image: $(basename "$resized_image")"
else
    echo "⚠️  No change made. Could not find 'source' to replace."
fi
