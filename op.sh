#!/bin/bash

projectDir="$(du ~ | fzf | awk '{print $2}')"

projectName="$(echo $projectDir | awk --field-separator '/' '{print $NF}')"

tmux new-window -c $projectDir -n $projectName
