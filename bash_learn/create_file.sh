#!/bin/bash

filename="$(date +'%Y%m%d_%H%M%S').txt"

#echo $filename

echo "$(date)" > "$filename"
