#!/bin/bash

cplusplus(){
    basedir="$HOME/Desktop/cpp/"
    dir=$(fd . $basedir --max-depth=1 -t=directory | xargs -I {} basename {} | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_project")


    terminal $basedir $dir
}

py(){
    basedir="$HOME/Desktop/python/"
    dir=$(fd . $basedir --max-depth=1 -t=directory | xargs -I {} basename {} | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_project")

    terminal $basedir $dir
}

repos(){
    basedir="$HOME/Desktop/repos"
    dir=$(fd . $basedir --max-depth=1 -t=directory | xargs -I {} basename {} | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_project")

    terminal $basedir $dir
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
esac
