#!/bin/bash

name=$0

pid=$$

sumarg=$#

meanarg=$@

lastcom=$?

idcom=$!

echo "$pid,$name,$sumarg,$meanarg,$lastcom,$idcom"
