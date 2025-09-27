#!/bin/bash

CONFIG="$HOME/.config/fastfetch/config.jsonc"

# Extract the image or logo path from the config file
IMAGE_PATH=$(grep -oP '"(image|logo)"\s*:\s*"\K[^"]+' "$CONFIG" | head -n 1)

if [[ -z "$IMAGE_PATH" ]]; then
  echo "No image or logo path found in $CONFIG"
  exit 1
fi

# Expand tilde (~) if used in path
if [[ "$IMAGE_PATH" == ~* ]]; then
  IMAGE_PATH="${IMAGE_PATH/#\~/$HOME}"
fi

if [[ -f "$IMAGE_PATH" ]]; then
  rm "$IMAGE_PATH"
  echo "Deleted image file: $IMAGE_PATH"
else
  echo "Image file not found: $IMAGE_PATH"
  exit 1
fi

# Call the random_fastfetch_logo.sh script after deleting the image
if [[ -x "./random_fastfetch_logo.sh" ]]; then
  ./random_fastfetch_logo.sh
else
  echo "Warning: random_fastfetch_logo.sh not found or not executable in the current directory."
fi
