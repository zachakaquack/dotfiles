#!/bin/bash

prompt="Enter Word: "
word=$(fuzzel -d -p "$prompt" -l 0 <<<"")

if [ -n "$word" ]; then
    $HOME/scripts/define.sh "$word"
fi
