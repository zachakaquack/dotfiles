#!/usr/bin/env bash

# INSTRUCTIONS:
# FIND MUSIC ON AMAZON MUSIC
# DOWNLOAD FROM https://lucida.to
# DRAG ZIP ONTO THIS SCRIPT IN A FILE MANAGER
# ...
# PROFIT
# file manager may crash (thunar does sometimes) but it'll move properly still

ZIP_FILE_NAME="$1"
ZIP_OUTPUT_DIR="_output" # gets removed after

[[ -z "$ZIP_FILE_NAME" ]] && exit

# EDIT THIS
MUSIC_PATH="$HOME/Music"

# EDIT THIS
# gets put in between MUSIC_PATH and the actual artist name
# for example, this puts OK COMPUTER by RADIOHEAD in "$HOME/Music/all/RADIOHEAD/OK COMPUTER"
EXTRA_PATH="all" # ---------------------------------------------> ^^^ this is the path

get_tags_json(){
    ffprobe -v quiet -of json -show_entries format_tags "$MUSIC_PATH/$ZIP_OUTPUT_DIR/$1"
}

# unzipping
id="$(notify-send --print-id "unzipping...")"
unzip "$ZIP_FILE_NAME" -d "$MUSIC_PATH/$ZIP_OUTPUT_DIR"
rm "$ZIP_FILE_NAME"

# get info for the directory
first_song="$(ls -1 "$MUSIC_PATH/$ZIP_OUTPUT_DIR" | head -n 1)"
artist="$(get_tags_json "$first_song" | jq '.format.tags.ARTIST' | sed 's/"//g')"
album_name="$(get_tags_json "$first_song" | jq '.format.tags.ALBUM' | sed 's/"//g')"

# create the directory if needed
FILES_PATH="$MUSIC_PATH/all/$artist/$album_name"
mkdir "$FILES_PATH" -p > /dev/null 2>&1

# move files to appropriate place
mv "$MUSIC_PATH/$ZIP_OUTPUT_DIR/"* "$FILES_PATH"

# finish
rm -rf "$MUSIC_PATH/$ZIP_OUTPUT_DIR"
notify-send --replace-id="$id" "finished"
