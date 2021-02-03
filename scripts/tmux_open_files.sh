#!/bin/bash

# This script will read in a list of files from the command line or stdin and open up a vim instance in a new window for each file

# we want the new windows to be opened at the end of our window list so first get the last window
NEXT_INDEX=$(tmux list-windows -F "#{window_index}"|tail -n 1)

FILE_LIST=()
# pull together the complete list of files 
while read FILE
do
  #tmux new-window -t $NEXT_INDEX -a -c $PWD -a -d -n $FILE "nvim $FILE"
  FILE_LIST+=("${FILE}")
done < <(printf "%s\n" ${*})

# first get the filename for each item.
FILE_NAMES=( $(basename -a ${FILE_LIST[@]}) ) 
DIR_NAMES=( $(dirname ${FILE_LIST[@]}) ) 

# then run through each component of the path and replace duplicates with ..
i=2
while [ $i -lt 20 ]; do
  RESULT=( $(printf "%s\n" "${DIR_NAMES[@]}" | cut -f$i -d/ | uniq -d) )
  # if the result is unique then we remove it
  if [[ ${#RESULT[@]} -eq 1 && -n "${RESULT[0]}" ]]; then
    DIR_NAMES=( $(printf "%s\n" "${DIR_NAMES[@]}" | sed -e "s/${RESULT[0]}//") )
  fi
  i=$((i+1))
done

# strip out the leftover strings of slash. We can't do this above because we are dividing the string by slashes
DIR_NAMES=( $(printf "%s\n" "${DIR_NAMES[@]}" | tr -s '/') )
# strip off the leading and trailing / 
DIR_NAMES=( $(printf "%s\n" "${DIR_NAMES[@]}" | sed -e 's/^\///' -e 's/\/$//') )

# merge our arrays together to get the full remaining filepath
for (( i=0; i<${#FILE_NAMES[*]}; ++i)); do
  tmux new-window -t $NEXT_INDEX -a -c $PWD -a -d -n "${FILE_NAMES[$i]} ${DIR_NAMES[$i]}" "nvim ${FILE_LIST[$i]}"
done



