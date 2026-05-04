#!/usr/bin/env bash

# defaults
DOWNLOAD_PATH="$HOME/Music/downloads"

SPLIT_CHAPTERS_OUTPUT="%(chapter_number)s - %(chapter)s.%(ext)s"
SINGLE_OUTPUT="%(title)s.%(ext)s"
PLAYLIST_OUTPUT="%(playlist_index)s - $SINGLE_OUTPUT"

na_check(){
    local na_file
    na_file="$DOWNLOAD_PATH/NA - NA.opus"
    [[ -f "$na_file" ]] && notify-send -t 3000 "NA FOUND!!!!"
}

audio_download_split_chapters(){
    local link
    link="$1"

    id=$(notify-send "Downloading: $link" -p -t 30000)

    yt-dlp "$link" \
        --split-chapters \
        --force-keyframes-at-cuts \
        -x --audio-quality 0 \
        -o "$SPLIT_CHAPTERS_OUTPUT" \
        -P "$DOWNLOAD_PATH"

    notify-send -r $id -t 3000 "Done downloading $link"
    na_check
}

audio_download_single(){
    local link
    link="$1"

    id=$(notify-send "Downloading: $link" -p -t 30000)

    yt-dlp "$link" \
        -x --audio-quality 0 \
        -o "$SINGLE_OUTPUT" \
        -P "$DOWNLOAD_PATH"

    notify-send -r $id -t 3000 "Done downloading $link"
    na_check
}

audio_download_playlist(){
    local link
    link="$1"

    id=$(notify-send "Downloading: $link" -p -t 30000)

    yt-dlp "$link" \
        -x --audio-quality 0 \
        -o "$PLAYLIST_OUTPUT" \
        -P "$DOWNLOAD_PATH"

    notify-send -r $id -t 3000 "Done downloading $link"
    na_check
}

main(){
    local options
    local link

    # enter link
    link=$(fuzzel -d --prompt-only "Enter Link: ")

    [[ -z "$link" ]] && exit

    # then choose how to download
    options="$link""\n"
    options+="Download Single (Audio)""\n"
    options+="Download Playlist (Audio)""\n"
    options+="Download and Split (Audio)""\n"

    choice="$(echo -e "$options" | fuzzel -d -l 4 --select-index=1)"
    case "${choice,,}" in
        "$link" ) exit ;;
        *"single"* ) audio_download_single "$link" ;;
        *"playlist"* ) audio_download_playlist "$link" ;;
        *"split"* ) audio_download_split_chapters "$link" ;;
    esac
}

main

# audio_download_split_chapters "https://youtu.be/DEogTtRsv5A"
# audio_download_single "https://youtu.be/NaBF7qsPxWg"
# audio_download_playlist "https://www.youtube.com/watch?v=ykU3qszBkKc&list=OLAK5uy_nckeXOcQx3V9mNy-Erq_OpPLrb4GANEMo"
