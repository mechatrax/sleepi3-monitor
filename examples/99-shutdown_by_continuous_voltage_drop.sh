#!/bin/bash
#
# To execute this file, set oheshot: false in monitor.yml
#
# EXAMPLE
#
# common:
#   interval: 1
# voltage:
#   history_size: 3
#   commands:
#     - exec: /etc/sleepi3-monitor/voltage.d/
#       condition: under
#       threshold: 10000
#       oneshot: false
#

source /usr/lib/sleepi3-monitor/parse_env.sh

if [ ${#VOLTAGE[@]} -lt $VOLTAGE_HISTSIZE ]
then
  exit 0
fi

for i in `seq $VOLTAGE_HISTSIZE`
do
  if [ ${VOLTAGE[$i]} -gt $THRESHOLD ]
  then
    exit 0
  fi
done

shutdown -h now

