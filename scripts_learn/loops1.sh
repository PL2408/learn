#!/bin/bash

VAR_1=$1

echo $(echo ${1~~}| rev)

result=$(echo ${VAR_1} | rev)

result2=${result~~}

echo $result2
