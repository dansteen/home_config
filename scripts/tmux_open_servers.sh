#!/bin/bash

# This script will open servers.
# if provided with a hash, it will look in nomad for the server for that allocation
# if provided with a ROLE and optional COUNT it will check chef for that role
# if provided with an IP address it will ssh to that ip
# if provided with a hostname it will connect to that host

if [ $# -lt 1 ]
then
  echo "Usage: $0 <selector> [environment] [count]"
  echo ""
  echo "  selector - a box selector as accepted by find_app.sh"
  echo "  environment - the env to limit results to. This only applies to chef role selectors"
  echo "  count - the maximum number of servers to connect to"
  exit 1
fi

# make sure our tmux variables are passed in
export TMUX TMUX_PANE

SELECTOR=$1
ENVIRONMENT=$2
# max open 10 windows
COUNT=${3:-10}
NUM=0

# open a window for each box
while read IP BOXNAME STARTDIR TITLE PORTS; do
  # limit the number of windows we will open
  if [ $NUM -ge $COUNT ]; then break; fi
  NUM=$(($NUM+1))

  # open our window
  /home/dsteen/scripts/tmux_ssh.sh $IP ${TITLE:-$BOXNAME} $STARTDIR &
done <  <(~/scripts/find-app.sh $SELECTOR $ENVIRONMENT)

