#!/usr/bin/env bash

dir="$HOME/Desktop/repos/notes"

list_notes(){
    fd ".*\.md|.*\.txt" --exclude "README\.md" "$dir" -t file | xargs -n 1 basename
}

construct_menu(){
    local note_names
    local basenames
    local note_name
    local other_options
    note_names=$1
    other_options="Today's Note\nNew Note\n"

    note_name="$(echo -e "$other_options$note_names" | fuzzel -d)"

    if [[ "$note_name" == "New Note" ]]; then
	echo "new_note"
	return
    fi

    if [[ "$note_name" == "Today's Note" ]]; then
	echo "todays_note"
	return
    fi

    if [[ -n "$note_name" ]]; then
	full_path="$dir/$note_name"
	echo "$full_path"
    fi
}

main(){

    local notes_paths
    notes_paths="$(list_notes)"
    note=$(construct_menu "$notes_paths")

    if [[ "$note" == "new_note" ]]; then
	$SCRIPTS/noter/new_notes.sh "$dir"

    elif [[ "$note" == "todays_note" ]]; then
	$SCRIPTS/noter/handle_todays_note.sh "$dir"

   elif [[ -n "$note" ]]; then
	$SCRIPTS/noter/open_note.sh "$note"
    fi
}


main
