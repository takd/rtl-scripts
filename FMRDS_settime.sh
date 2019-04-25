#!/bin/bash
if (( $EUID != 0 )); then
    echo "To set the time, this script needs to be run as root."
    exit
fi
freq=${1:-95.8M} # 95.8 MHz is the default, but can be changed
echo 'Waiting for time RDS message on $freq...'
echo ''
time=$(eval "rtl_fm -M fm -l 0 -A std -p 0 -s 171k -g 20 -F 9 -f $freq | redsea | jq --unbuffered -r -n -f clock_time_filter.jq")
echo ''
echo 'Time message content:'
echo $time
echo 'Now setting time.'
date --set="$time"

