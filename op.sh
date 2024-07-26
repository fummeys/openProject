#!/bin/bash

type=$1

source ~/.op/oprc

projectDir="$(du $projectDirs | fzf | awk '{print $2}')"

projectName="$(echo $projectDir | awk --field-separator '/' '{print $NF}')"

openWindow(){
    if [[ $TERM_PROGRAM = "tmux" ]]; then
        tmux new-window -c $projectDir -n $projectName
    else
        tmux
        tmux new-window -c $projectDir -n $projectName
    fi
}

openSession(){
    if [[ $TERM_PROGRAM = "tmux" ]]; then
        tmux switch-client -t `tmux new-session -dP -c $projectDir -n $projectName`
    else
        tmux attach -t `tmux new-session -dP -c $projectDir -n $projectName`
    fi
}

if [[ $type == "n" ]]; then
    openWindow
else
    openSession
fi
