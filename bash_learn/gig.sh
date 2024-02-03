#!/bin/bash

gig=$1

mb=$(($gig * 1024))

kilo=$(($mb * 1024))

echo "$mb $kilo"
