#!/bin/bash

WAIT=3
THRESHOLD=10000

source /usr/lib/sleepi3-monitor/parse_env.sh

echo ${VOLTAGE[*]}

if [ ${#VOLTAGE[@]} -lt $WAIT ]
then
  exit 0
fi

for i in `seq $WAIT`
do
  if [ ${VOLTAGE[$i]} -gt $THRESHOLD ]
  then
    exit 0
  fi
done

shutdown -h now

