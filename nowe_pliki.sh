#!/bin/bash --

#short script to make test files


funkcja_p_ile()
{

	echo "wpisz ile chcesz plików: "
	read liczba1
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
}

	echo "Witaj , ile chcesz plików: "
funkcja_p_ile
funkcja_czy_jeszcze()
{
echo "chcesz utworzyć jeszcze? [t/n]:"
read pytanie
if [[ $pytanie =~ [yYTt] ]]
then
funkcja_p_ile
fi
}
funkcja_czy_jeszcze
sum_p=$(ls *.txt *.end | wc -w)
echo utworzono $sum_p plików.


# w następnej wersji można by zastosować zew.
# funkce np; source ~/naszplik_z_funkcjami
# np; na inne możliwe pliki do tworzenia

