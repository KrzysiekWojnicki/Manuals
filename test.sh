#!/bin/bash
# if (($# == 0)); then
# 	echo -e "nie podano żadnej op\n -h --hepl"
if ( ! getopts ":f:xh" opcja )
then echo "funkcja $0 nie przyjmuje ($1)  ,spr -h"
else 

while getopts ":f:xh" opcja;
do
	case $opcja in
		h) echo -e "help\nf -tworzenie pliku\nh -help";; 
		f) echo $OPTARG ;;
		\?) echo nieprawidłowa op -$OPTARG ;; 
		:) echo opcja -$OPTARG potrzebuje argumentu;;
	esac
done
fi
