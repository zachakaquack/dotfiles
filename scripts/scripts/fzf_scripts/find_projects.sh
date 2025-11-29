#!/bin/bash
#find / -name "*.git" -type d

projecttype=$1

cplusplus(){
    dir=$(fd . $HOME/Desktop/cpp --max-depth=1 -t=directory | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_project")
    terminal dir
}

py(){
    dir=$(fd . $HOME/Desktop/python --max-depth=1 -t=directory | $HOME/scripts/fzf_scripts/fzfmenu.sh "fzf_project")
}

terminal(){
    dir=$1
    notify-send $1
}

case $projecttype in
    "cpp") cplusplus ;;
    "c++") cplusplus ;;
    "python") py ;;
    "py") py ;;
esac
