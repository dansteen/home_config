#/bin/bash -x
# this script will monitor a file and, when the contents are updated will insert the contents into the tmux clipboard
# it accepts the name of the file to monitor on the command line
/usr/bin/fswatch -m poll_monitor -0 $1 | xargs -0 -n 1 -I {} tmux -L inner loadb {}
