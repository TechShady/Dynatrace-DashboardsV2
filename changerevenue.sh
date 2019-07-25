#!/bin/bash

if [[ $1 == "" ]]; then
   echo "Usage: $0 "
   exit
fi

for i in `ls *.json`; do
   sed -i'' -e "s/doubleProperties.revenue/$1/g" $i
done
