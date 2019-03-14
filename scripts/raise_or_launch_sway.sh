#!/bin/bash

# this script will raise a provided window or run cmd if not found.  works with sway

function printUsage {
  echo "raise a window or run a command"
  echo ""
  echo "Usage: "
  echo " $0 -c <class> [ -w ] | <class_name> <cmd>"
  echo ""
  echo "   -c   The class, classname, or title to search for"
  echo "   -w   Restrict our search to the current desktop"
  echo "   <cmd>  The command to run if no matching window is found"
  echo ""
}

# find focused window
#swaymsg -t get_tree | jq -r '.. | select(.focused?==true)'
# find window with app_id class or title and return its id
#swaymsg -t get_tree | jq -r '.. | select(.app_id?=="dave" or .class?=="dave" or .instance?=="dave" or .name?=="dave" or .title?=="dave") | .id'
# find window in current workspace and return its con_id may not work with more than one output
#swaymsg -t get_tree | jq -r '.. | select(.type?=="workspace" and .name=="personal") | .. | select(.app_id?=="dave" or .window_properties?.class?=="dave" or window_properties?.instance?=="dave" or .name?=="dave" or .window_properties?.title?=="dave") | .id'

SEARCHSTRING=""
CURRENT_WORKSPACE_FILTER=""
# pull in our options
# handle our options
while [[ $# -gt 0 ]]; do
    OPT="$1"
    case $OPT in
      -c)
        shift
        SEARCHSTRING='.. | select(.app_id?=="'$1'" or .window_properties?.class?=="'$1'" or .window_properties?.instance?=="'$1'" or .name?=="'$1'" or .window_properties?.title?=="'$1'") | .id'
        ;;
      -h)
        printUsage
        ;;
      -w)
        CURRENT_WORKSPACE="$(swaymsg -t get_tree | jq -r '.. | select(.current_workspace?) | .current_workspace')"
        CURRENT_WORKSPACE_FILTER='.. | select(.type?=="workspace" and .name=="'${CURRENT_WORKSPACE}'") |'
        ;;
      *)
        break
        ;;
    esac
    shift
done

# find our window if it exists
CON_ID="$(swaymsg -t get_tree | jq -r "$CURRENT_WORKSPACE_FILTER $SEARCHSTRING")"

# if it fails, launch our command
if [ -z "$CON_ID" ]; then
  ${@} &
# otherwise activate the window
else
  swaymsg \[con_id=$CON_ID\] focus
fi

