#!/bin/bash

# this script will open a new window in tmux and mosh to the provided server

DEST=$1
# set the name if we have set it.  otherwise strip off traitify.com from the dest
NAME="${2:-${DEST%%.traitify.com}}"
# also strip off .awse.node.consul
NAME="${NAME%%.awse.*}"
STARTDIR="$3"

# we always use the same session name
SESSION_NAME=dan_session
tmux new-window -a -d -n $NAME "mosh --ssh 'ssh -X' -- $DEST bash start_tmux.sh $SESSION_NAME" 2>&1 >> /tmp/log.out # $STARTDIR" 
#tmux -L inner new-window -d -n $NAME "mosh --ssh 'ssh -X' -- $DEST tmux new-session -A -s $SESSION_NAME"

