#!/bin/bash
tmux -L outer -f ~/.tmux_outer.conf
sleep 1
tmux -L outer split-window -h

