#!/bin/bash

	BOLD=$(tput bold)
	NORM=$(tput sgr0)
	REV=$(tput rev)

# funkcja help
function HELP {
echo -e \\n"Help documentation for ${BOLD}$0.${NORM}"\\n
echo -e "${REV}Basic usage:${NORM} ${BOLD}$0 [option]${NORM}"\\n
echo "Command line switches are optional. The following switches are recognized."
echo "${REV}-f${NORM}  --domyślna opcja ,tworzy plik"
echo "${REV}-x${NORM}  --robi cuda , przyjmuje argumet w postaci striga"
echo -e "${REV}-h${NORM}  --Displays this help message. No further functions are performed."\\n
echo -e "Example: ${BOLD}$0 -h ; -f ; -x [parametr] ${NORM}"\\n
exit 1
}
    
# funkcja sprawdzająca 
#function SPR {
if (($# == 0)); then
	echo -e "nie podano żadnej opcji, spróbuj ${BOLD}-h --hepl${NORM}"
elif ( ! getopts ":xfh" opcja )
	then echo -e "nieprawidłowa opcja funkcji ${BOLD}$0 ${NORM} spróbuj ${BOLD} -h --hepl${NORM}" 
	fi


while getopts ":x:fh" opcja;
	# x: -znaczy że opcja przyjmuje argumet
do
	case $opcja in
		h) HELP ;;
		f) echo wybrałeś f ;;
		x) echo wybrałeś -x z parametrem $OPTARG ;;
		\?) echo opcja${BOLD} -$OPTARG ${NORM}nie istnieje ..jeszcze :\) ,spróbuj${BOLD} -h --hepl${NORM}
			exit 1;;
		:) echo opcja ${BOLD}-$OPTARG${NORM} potrzebuje argumentu;;
	esac
done
shift $(expr $OPTIND - 1) 
# to samo co shift 3 , przesówa $1 na pole 4 czyli po maszych 3 flagach


