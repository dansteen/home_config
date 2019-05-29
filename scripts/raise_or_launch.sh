#!/bin/bash

# this script will raise a provided window class or run a command if none is found

function printUsage {
  echo "raise a window or run a command"
  echo ""
  echo "Usage: "
  echo " $0 -c <class> [ -w ] | <class_name> [-e \"ENV=VALUE\"] <cmd>"
  echo ""
  echo "   -c   The class, classname, or title to search for"
  echo "   -w   Restrict our search to the current desktop"
  echo "   -e   Set the env variable prior to executing command"
  echo "   <cmd>  The command to run if no matching window is found"
  echo ""
}

SEARCHSTRING=""
# pull in our options
# handle our options
while [[ $# -gt 0 ]]; do
  OPT="$1"
  case $OPT in
    -c)
      shift
      SEARCHSTRING="$1"
      ;;
    -h)
      printUsage
      ;;
    -w)
      DESKTOP_STRING="--desktop `xdotool get_desktop`"
      ;;
    -e)
      shift
      export $1
      ;;
    *)
      break
      ;;
  esac
  shift
done

# set the command to run
#COMMAND="$@"

# get a list of window IDs 
WINDOWIDS=($(xdotool search $DESKTOP_STRING "$SEARCHSTRING"))

FOUND="false"
# run throuh all of our window IDs in reverse order (since the id we want is usually toward the end)
for (( idx=${#WINDOWIDS[@]}-1 ; idx>=0 ; idx-- )) ; do
  OUTPUT="$(xdotool windowactivate ${WINDOWIDS[$idx]} 2>&1)"
  if [[ "$OUTPUT" != *"failed"* ]]; then
    FOUND="true"
    break
  fi
done

# if it fails, launch our command
if [ "$FOUND" != "true" ]; then
  "${@}" 
fi

