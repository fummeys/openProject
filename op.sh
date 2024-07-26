#!/bin/bash

type=$1

echo $type

source ~/.op/oprc

projectDir="$(du $projectDirs | fzf | awk '{print $2}')"

projectName="$(echo $projectDir | awk --field-separator '/' '{print $NF}')"

openWindow(){
	tmux new-window -c $projectDir -n $projectName
}

openSession(){
	tmux switch-client -t `tmux new-session -dP -c $projectDir -n $projectName -s $projectName`
}


if [[ $type == "n" ]]; then
    openWindow
else
    openSession
fi


