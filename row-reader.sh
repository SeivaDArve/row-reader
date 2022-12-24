#!/bin/bash

# Example of generating a number between 2000 and 65000
   #shuf -i 2000-65000 -n 1

case $1 in

   -n)
      v_num=$2
      head -n $2 $3 | tail -n 1
   ;;
   *)
      v_num=$(wc $1) 
      shuf -i 0-${v_num} -n 1
   ;;
esac
