#!/bin/bash



if (($# == 0)); then
	echo -e "nie podano żadnej opcji, spróbuj -h --hepl"
elif ( ! getopts ":f:xh" opcja )
	then echo "nieprawidłowa opcja funkcji $0 , spróbuj -h"
	fi


while getopts ":f:xh" opcja;
do
	case $opcja in
		h) echo -e "help\nf -tworzenie pliku\nh -help";; 
		f) echo wybrałeś -f z parametrem $OPTARG ;;
		\?) echo nieprawidłowa opcja- $OPTARG ;; 
		:) echo opcja -$OPTARG potrzebuje argumentu;;
	esac
done
