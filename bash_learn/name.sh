#!/bin/bash

echo "enter your first name:"

read name

echo "your first name is $name"

echo "enter your last name:"

read name1

echo "your last name is $name1"

echo "so, you are $name $name1"

reversed_names=$(echo "$name $name1" | rev)

echo "or maybe you are $reversed_names"

