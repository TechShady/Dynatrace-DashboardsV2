#!/bin/bash

if [[ $1 == "" ]]; then
   echo "Usage: $0 youremail.com"
   exit
fi

for i in `ls *.json`; do
   sed -i'' -e "s/\"owner\":\"[^\"]*\"/\"owner\":\"$1\"/g" $i
done
