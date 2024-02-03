#!/bin/bash

distro="ubuntu"

echo ${#distro}

str1="hand"

str2="book"

str3=$str1$str2

echo $str3

str="Petro Lazarenko is DevOps"

word="is"

expr index "$str" "$word"

foss="Petro Lazarenko is 41 years old"

echo "${foss:0:5}"

echo ${foss/Petro/Olga}
