#!/bin/bash

cplusplus(){
    basedir="$HOME/Desktop/cpp/"
    fzfargs="--preview='ls $basedir/{}'"
    dir=$($SCRIPTS/fzf_scripts/menu.sh "$(fd . $basedir --max-depth=1 -t=directory | xargs -I {} basename {})")


    terminal $basedir $dir
}

py(){
    basedir="$HOME/Desktop/python/"
    fzfargs="--preview='ls $basedir/{}'"
    dir=$($SCRIPTS/fzf_scripts/menu.sh "$(fd . $basedir --max-depth=1 -t=directory | xargs -I {} basename {})")

    terminal $basedir $dir
}

repos(){
    basedir="$HOME/Desktop/repos"
    fzfargs="--preview='ls $basedir/{}'"
    dir=$($SCRIPTS/fzf_scripts/menu.sh "$(fd . $basedir --max-depth=1 -t=directory | xargs -I {} basename {})")

    terminal $basedir $dir
}

# no longer use
scripts(){
    basedir="$SCRIPTS"
    file=$(fd . $basedir | xargs -I {} basename {} | $SCRIPTS/fzf_scripts/menu.sh "fzf_project")

    if [[ -n $file ]]; then
        kitty --directory "$basedir" sh -c "cat ~/.cache/wal/sequences; nvim \"$file\"; exec \$SHELL" &
    fi
}

terminal(){
    if [[ -n $2 ]]; then
        kitty --directory "$1/$2" &
    fi
}

projecttype=$1
case $projecttype in
    "cpp") cplusplus ;;
    "c++") cplusplus ;;
    "python") py ;;
    "py") py ;;
    "repos") repos ;;
    "scripts") scripts ;;
esac
