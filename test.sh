#!/bin/bash

NORM=`tput sgr0`
BOLD=`tput bold`
REV=`tput smso`
    
# funkcja sprawdzająca 
function SPR {
if (($# == 0)); then
	echo -e "nie podano żadnej opcji, spróbuj -h --hepl"
elif ( ! getopts ":f:xh" opcja )
	then echo "nieprawidłowa opcja funkcji $0 , spróbuj -h"
	fi


while getopts ":f:xh" opcja;
do
	case $opcja in
		h) HELP ;;
		f) echo wybrałeś -f z parametrem $OPTARG ;;
		\?) echo nieprawidłowa opcja- $OPTARG ;; 
		:) echo opcja -$OPTARG potrzebuje argumentu;;
	esac
done
}

# funkcja help
function HELP {
echo -e \\n"Help documentation for ${BOLD}${SCRIPT}.${NORM}"\\n
echo -e "${REV}Basic usage:${NORM} ${BOLD}$SCRIPT file.ext${NORM}"\\n
echo "Command line switches are optional. The following switches are recognized."
echo "${REV}-a${NORM}  --Sets the value for option ${BOLD}a${NORM}. Default is ${BOLD}A${NORM}."
echo "${REV}-b${NORM}  --Sets the value for option ${BOLD}b${NORM}. Default is ${BOLD}B${NORM}."
echo "${REV}-c${NORM}  --Sets the value for option ${BOLD}c${NORM}. Default is ${BOLD}C${NORM}."
echo "${REV}-d${NORM}  --Sets the value for option ${BOLD}d${NORM}. Default is ${BOLD}D${NORM}."
echo -e "${REV}-h${NORM}  --Displays this help message. No further functions are performed."\\n
echo -e "Example: ${BOLD}$SCRIPT -a foo -b man -c chu -d bar file.ext${NORM}"\\n
exit 1
}

# Właściwy Start Kodu
SPR
