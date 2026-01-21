#!/usr/bin/env bash

open_ghostty(){
    local note_name
    local base
    local dir
    local commands

    note_name=$1
    # weird workaround to get multiple commands
    # in the ghostty startup commands
    commands="$SCRIPTS/noter/ghostty_launch.sh $note_name"

    # purposely no quotes around commands so they get 
    # interpreted as different args
    ghostty --working-directory="$dir" -e $commands
}

note_name=$1
open_ghostty "$note_name"
