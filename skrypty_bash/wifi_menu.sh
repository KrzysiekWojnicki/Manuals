#!/bin/bash

iw='/home/kw/Nowyfolder/plik_iw_scan'
a=$(awk -F: '/ESSID/{ print $2 }' $iw | head -n 1)
c=$( awk '/Cell/{ print } ' $iw | wc -l )
#awk  '/Encry/{ print }' plik_iw_scan 
#awk -F: '/Bit Rates/{ print }' plik_iw_scan 
 echo "$a" 
 echo $c
