#!/bin/bash

# this script will add a task using the rtm-cli
# it allows us to use the standard shortcuts

TASK=""
TAGS=""
# strip out the tags provided
for WORD in $*
do
    case $WORD in
	\#*)
	    # if it's a tag we strip off the hash and change it to a t:
	    TAGS="$TAGS ${WORD/\#/t:}"
	    ;;
	^*)
	    # if it's a timestamp we strip off the beginning
	    TIMESTAMP="${WORD##^}"
	    ;;
	!*)
	    # if it's a priority we change it to a p:
	    PRIORITY="${WORD/!/p:}"
	    ;;
	*)
	    # anything else we take as part of the task
	    TASK="$TASK $WORD"
	    ;;
    esac
done

# timestamp defaults to today
TIMESTAMP="${TIMESTAMP:=today}"
rtm add $TASK $TIMESTAMP $PRIORITY $TAGS
    
