#!/usr/bin/env bash

dir=$1
cd "$dir"

name="$(fuzzel -d --prompt-only "Name: " | sed 's/ /_/g').md"
full="$dir/$name"

if [[ -f "$full" ]]; then
    notify-send "$name already exists!"
    $SCRIPTS/noter/open_note.sh "$full"
    exit
fi

if [[ "$name" == ".md" ]]; then
    exit
fi

echo "# $name" > "$full"
$SCRIPTS/noter/open_note.sh "$full"
