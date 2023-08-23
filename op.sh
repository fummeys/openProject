#!/bin/bash

projectDir="$(du ~ | fzf | awk '{print $2}')"

projectName="$(echo $projectDir | awk --field-separator '/' '{print $NF}')"

openWindow(){
	tmux new-window -c $projectDir -n $projectName
}

openSession(){
	tmux new-session -c $projectDir -n $projectName
}

openWindow

if [[ $? == 1 ]]; then
	openSession
fi
