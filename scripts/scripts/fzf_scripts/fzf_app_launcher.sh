#!/bin/bash

localappsdir="$HOME/.local/share/applications/"
usrappsdir="/usr/share/applications/"
directories=($localappsdir $usrappsdir)
declare -A unedited_entries
declare -A keys;

# get desktops from local
for directory in "${directories[@]}"; do
    for entry in $directory*.desktop; do
        while IFS= read -r line; do
            if [[ $line = \Name=* ]] ; then
                # only enter if not already in dir
                if [[ ! "${keys[@]} " =~ "$line" ]]; then
                    name=${line:5:${#line}}
                    name="$(echo $name | sed 's/ /_/g')\n";
                    keys+=($line)
                    echo "adding $name"
                    unedited_entries[" $name"]="$entry";
                fi;
            fi;
        done < "$entry";
    done;
done;

# for name in ${!unedited_entries[*]}; do
#     printf "$name"
# done;
# printf "${!unedited_entries[*]}"
key=$(printf "${!unedited_entries[*]}" | $HOME/scripts/fzf_scripts/fzfmenu.sh)
value="$unedited_entries[$key\n]"
echo "key: $key, value: $value"

# format names
# for unedited in "${unedited_entries[@]}"; do
#     echo $unedited
# length=${#unedited};
# name=${unedited:5:length};
# entries["$name"]="$unedited";
# done;

# echo $entries

