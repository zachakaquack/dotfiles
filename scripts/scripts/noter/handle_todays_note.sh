#!/usr/bin/env bash

dir=$1


d="$(date -u +%Y-%m-%d)"
name="$d.md"
full="$dir/$name"

if [[ ! -f "$full" ]]; then
    echo "# $d" > "$full"
fi

$SCRIPTS/noter/open_note.sh "$full"
