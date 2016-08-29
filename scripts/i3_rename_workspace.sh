#!/bin/bash

# this script will rename the current window to the provided value

NEW_NAME="$1"

# get the number of the current workspace
CUR_NUM=$(i3-msg -t get_workspaces |jq '.[] | select(.focused==true) | .num')
# get the current name
CUR_NAME=$(i3-msg -t get_workspaces |jq '.[] | select(.focused==true) | .name')

echo $CUR_NAME
echo $CUR_NUM

# set the workspace name
i3-msg "rename workspace $CUR_NAME to ${CUR_NUM}: $NEW_NAME" 

