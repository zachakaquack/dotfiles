#!/bin/bash

cplusplus(){
    dir=$(fd . $HOME/Desktop/cpp -t=directory | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_project")
    terminal $dir
}

py(){
    dir=$(fd . $HOME/Desktop/python --max-depth=1 -t=directory | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_project")
    terminal $dir
}

repos(){
    dir=$(fd . $HOME/Desktop/repos --max-depth=1 -t=directory | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_project")
    terminal $dir
}

terminal(){
    if [[ -n $1 ]]; then
        kitty --directory "$1" &
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
