#!/bin/bash

echo -n "Please enter a filename: "

read filename

nlines=$(wc -l < $filename)

echo "There are $nlines lines in $filename"
