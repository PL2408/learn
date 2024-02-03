#!/bin/bash

#array=("count_lines.sh" "count_lines1.sh" "date.sh" "find.sh" "hello.sh" "name.sh" "pi.sh" "pwd.sh" "ss.sh" "whoami.sh")

#echo ${array[3]} ${array[4]}

#array+=("array.sh")

array=($(find "/mnt/c/git/bash_learn" -type f -name "*.sh" -exec basename {} \;))

echo ${array[@]}

echo ${#array[@]}

unset "array[10]"

echo ${array[@]}

echo ${#array[@]}
