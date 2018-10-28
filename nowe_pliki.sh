#!/bin/bash --

#short script to make test files


	echo "Witaj , ile chcesz plików: "
	
funkcja_p_ile()
{

	echo "wpisz ile chcesz plików: "
	read liczba1
	l=0
	suma[l]=$liczba1
	for (( c=1 ; c<=$liczba1 ; c++))
	do
		r=$(( $RANDOM % 2 ))
		case $r in
			  "0") ko='txt';;
			  "1") ko='end';;
		   	  *) echo coś poszło nie tak
		esac
		ra=$(head /dev/urandom | tr -dc A-Za-z | head -c 6)
	touch $ra.$ko
	done
	funkcja_czy_jeszcze
}

funkcja_czy_jeszcze()
{
echo "chcesz utworzyć jeszcze? [t/n]:"
read pytanie
if [[ $pytanie =~ [yYTt] ]]
	then
	funkcja_p_ile  
elif [[ $pytanie =~ [nN] ]]
then
	# zliczanie
	n_zlicz
else
	echo '[t/n]?'
	funkcja_czy_jeszcze

fi
}

zliczanie(){
sum_p=$(ls *.txt *.end | wc -w)
echo utworzono $sum_p plików.
}
n_zlicz(){
	echo "${suma[*]}" liczb
}
###### CODE #########

funkcja_p_ile

# w następnej wersji można by zastosować zew.
# funkce np; source ~/naszplik_z_funkcjami
# np; na inne możliwe pliki do tworzenia

