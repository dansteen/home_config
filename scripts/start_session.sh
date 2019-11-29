#!/bin/bash
tmux -L traitify -f ~/.tmux_outer.conf
sleep 1
tmux -L traitify split-window -h

