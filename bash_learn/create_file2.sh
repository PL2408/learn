#!/bin/bash

set -x

filename="$(date +'%Y%m%d_%H').txt"

echo "[LOG] Date: $_date:DEBUG: Some event" >> "$filename"

bn=$(basename $0)

log_file="${bn%.*}.$(date +'%Y%m%d').log"

echo "$bn: $(date +'%Y%m%d %Hh %Mm %Ss'): filename=$filename" >> $log_file

_date="$(date +'%Y%m%d_%H%M%S')"

echo "$bn: $(date +'%Y%m%d %Hh %Mm %Ss'): start computition" >> $log_file
sleep 3
echo "$bn: $(date +'%Y%m%d %Hh %Mm %Ss'): end computition" >> $log_file

set +x

exit 0
