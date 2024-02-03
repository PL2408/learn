#!/bin/bash

filesize1=$(du -b $1 | cut -f1)

filesize2=$(du -b $2 | cut -f1)

echo "$filesize1 $filesize2"

total=$(($filesize1 + $filesize2))

echo "$total"


