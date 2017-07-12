#!/bin/bash

# This script will query chef and open all servers with the role and optionally environment supplied
# It also allows for a box name to be specified

if [ $# -lt 1 ]
then
  echo "Usage: $0 <role> | <boxname> [<environment>] [<count>]"
  exit 1
fi

ROLE=$1
ENVIRONMENT=$2
COUNT=$3

# detect a box name
if [[ "$ROLE" == *.* ]]
then
  /home/dsteen/scripts/i3_ssh.sh $ROLE &
else
  # the knife command only exists in chefs ruby
  source /usr/share/chruby/chruby.sh
  chruby ruby-2.1.9
  QUERY=`knife search node "roles:$ROLE ${ENVIRONMENT:+AND chef_environment:$ENVIRONMENT}" -a fqdn|grep fqdn|awk '{print $2}'|head -n ${COUNT:-10}`

  for HOST in ${QUERY[*]}
  do
    /home/dsteen/scripts/i3_ssh.sh $HOST &
  done
fi



