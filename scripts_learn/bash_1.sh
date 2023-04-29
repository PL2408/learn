#!/bin/bash
# display user home
echo "Home for the current user is: $HOME"
echo "I have \$1 in my pocket"

# testing variables
age=40
person="Petro"
echo "My name is $person, I'm $age years old"

mydir=$(pwd)
echo $mydir

var1=$(( 1 + 1 ))
echo $var1
var2=$(( $var1 * 2 ))
echo $var2


var1=$(( 2 + 2 ))
var2=$(( 3 + 3 ))
if
[ "$var1" = "$var2" ] 
then
	echo "All correct"
else
	echo "It false"
fi


user=Lopihara

if 
	grep $user /mnt/c/Users
then
	echo "This $user is exist"
else
	echo "No $user"
fi

val1=6
if [ $val1 -gt 5 ]
then
echo "The test value $value1 is greater than 5"
else
echo "The test value $value1 is not greater than 5"
fi

val1=Petro
val2=Vitaliy
if [ $val1 \> $val2 ]
then
echo "$val1 is greater than $val2"
else
echo "$val1 is less than $val2"
fi

mydir=/home/lopihara
if [ -d $mydir ]
then
echo "The $mydir directory exists"
cd $mydir
else
echo "The $mydir directory does not exist"
fi








