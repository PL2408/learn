#!/bin/bash
for var in Vitaliy Kharkivskiy Boris Petro 
do
echo $var
done

file=testlog.txt
IFS=$'\n'
for var in $(cat $file)
do
echo "$var"
done

for file in /mnt/c/git/learn/scripts_learn/*
do
if [ -d "$file" ]
then
echo "$file is a directory"
elif [ -f "$file" ]
then
echo "$file is a file"
fi
done

for (( i=1; i <= 10; i++ ))
do
echo "$i"
done

