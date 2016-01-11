#!/bin/bash

# this script will wrap ssh for i3 so that we can provide a proper title to the window

NAME=$1
st -e tmux new-session -d "printf '\033k$NAME\033\\' && ssh -X $NAME" \; attach
