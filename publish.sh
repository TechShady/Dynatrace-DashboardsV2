#!/bin/bash

case "$1" in
yes)
   for i in `ls *.json`; do
      sed -i'' -e 's/"published":false/"published":true/' $i
   done
   ;;
no)
   for i in `ls *.json`; do
      sed -i'' -e 's/"published":true/"published":false/' $i
   done
   ;;
*)
   echo "Usage: $0 yes|no"
   exit
   ;;
esac
