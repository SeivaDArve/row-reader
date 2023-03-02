#!/bin/bash
clear

# Make a temporary file 
   mkdir -p ~/.tmp/
   rr1="~/.tmp/rr1"
   rr2="~/.tmp/rr2"

# # Asking for the user to paste text
#    echo "Paste your text into this variable to be shuffled"
#    read -p ' > ' v_ans
#    sleep 3

# Ask for a file to be read:
   echo "Tell me what file to read from"
   read -p " > " v_ans

# Put the text into the tmp file
   #echo $v_ans > ~/.tmp/rr1
   cat $v_ans > ~/.tmp/rr1


   sleep 3
# Counting how many lines there are inside the tmp file with the desired search pattern
   echo "what is the desired pattern to be read from the file? (example: http)"
   read -p " > " v_ans
   grep "$v_ans" ~/.tmp/rr1 > ~/.tmp/rr2
   v_count_text=$(wc -l $rr2)
   echo "$v_count_text" > $rr1
   v_count=$(cut -d " " -f 1 $rr1)
   echo "count= $v_count"
   read -t 1

# generating a number between 0 and $v_count
   v_number=$(shuf -i 0-${v_count} -n 1)
   echo "Number generated: $v_number"
      
# Example of generating a number between 2000 and 65000
   #shuf -i 2000-65000 -n 1

case $1 in

   -n)
      v_num=$2
      head -n $2 $3 | tail -n 1
   ;;
#  *)
#      v_num=$(wc $1) 
#      shuf -i 0-${v_num} -n 1
#   ;;
esac
