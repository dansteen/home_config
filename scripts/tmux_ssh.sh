#!/bin/bash

# this script will open a new window in tmux and mosh to the provided server

DEST=$1
# set the name if we have set it.  otherwise strip off traitify.com from the dest
NAME="${2:-${DEST%%.traitify.com}}"
# also strip off .awse.node.consul
NAME="${NAME%%.awse.*}"
STARTDIR="$3"

# make sure our tmux variables are passed in
export TMUX TMUX_PANE

# we always use the same session name
SESSION_NAME=dan_session
#tmux -L inner display-message -p '#{session_id}:#{window_id}' >> /tmp/test.tmux
#tmux -L inner list-windows >> /tmp/test.tmux
tmux new-window -a -d -n $NAME "mosh --ssh 'ssh -X' -- $DEST bash start_tmux.sh $SESSION_NAME" # $STARTDIR" 
#tmux -L inner new-window -d -n $NAME "mosh --ssh 'ssh -X' -- $DEST tmux new-session -A -s $SESSION_NAME"

