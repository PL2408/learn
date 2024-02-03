#!/bin/bash

nlines=$(wc -l < $1)

echo "There are $nlines lines in $1"
