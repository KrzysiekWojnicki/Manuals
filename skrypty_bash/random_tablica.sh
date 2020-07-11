#!/bin/bash

# wybieracz randomowego obiektu z tablcy
t=("dupa" "nied")
rand=$[$RANDOM % ${#t[@]}]
#r=$(( $RANDOM % ${t[*]} ))
echo ${t[$rand]}
