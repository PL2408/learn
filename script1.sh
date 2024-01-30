#!/bin/bash

echo "concatenate two parameters"

str1=$1

str2=$2

if [ "$#" -ne "2" ]
then
	echo "error: number of parameters not equal 2"
	exit 1
fi


#echo "param3: $3"
#exit 0

echo -n "enter character: "
read ch
l=${#ch}

if [ "$l" -eq "1" ]
then
	echo "${str1^^}$ch${str2^^}"
	echo '${str1^^}$ch${str2^^}'
else
	echo "error: number of characters should be 1, recieved: $l"
	exit 1
fi

exit 0


