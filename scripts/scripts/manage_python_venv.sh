#!/bin/bash

VENV_DEFAULT_NAME=".venv"
VENV_PATH="$(pwd)/$VENV_DEFAULT_NAME"

create_venv(){
    python -m venv $VENV_DEFAULT_NAME
}

activate_venv(){
    source "$VENV_PATH/bin/activate"
    notify-send "activated venv!"
}

# create venv if doesnt exist
if [ ! -d "$VENV_PATH" ]; then
    create_venv
fi

# activate
activate_venv
