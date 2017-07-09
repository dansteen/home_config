#!/bin/bash

# this script will wrap ssh for i3 so that we can provide a proper title to the window

NAME=$1
# we always use the same session name
SESSION_NAME=dan_session
st -f "Misc Fixed:pixelsize=13:style=SemiCondensed" -T $NAME -e mosh --ssh "ssh -X" -- $NAME tmux new-session -A -s $SESSION_NAME


