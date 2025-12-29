#!/usr/bin/env bash

prompt="Enter Word: "
word=$(fuzzel -d -p "$prompt" -l 0 <<<"")

if [ -n "$word" ]; then
    $SCRIPTS/define.sh "$word"
fi
