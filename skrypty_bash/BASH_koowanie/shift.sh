#!/bin/bash
for (( i = 0; i <= 4; i++ ))
do
  echo 'Shifted' $i 'time(s):'
  echo -----------------
  echo 1: $1
  echo 2: $2
  echo 3: $3
  echo 4: $4
  echo
  shift
done
