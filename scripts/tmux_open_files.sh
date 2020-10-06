#!/bin/bash

# This script will files

if [ $# -lt 1 ]
then
  echo "Usage: $0 <file> [<file> ...]"
  echo ""
  echo "  file - file to open"
  exit 1
fi

# make sure our tmux variables are passed in
export TMUX TMUX_PANE


# open a window for each box
for FILE in $*; do
  # open our window
  tmux new-window -c $PWD -a -d -n $FILE "nvim $FILE"
done 


