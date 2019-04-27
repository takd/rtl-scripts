#!/bin/bash
freq=${1:-95.8M} # 95.8 MHz is the default, but can be changed
rtl_fm -M fm -l 0 -A std -p 0 -s 171k -g 20 -F 9 -f $freq | redsea | jq -r --unbuffered '.clock_time' | grep -v 'null' --line-buffered
