#!/bin/bash
if (( 10 + 10 == 21 )); then
    echo "test is true"
else
    echo "test is false" > testlog.txt
fi

