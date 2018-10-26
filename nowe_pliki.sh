#!/bin/bash --

#short script to make test files

funkcja_czy_jeszcze()
{
echo "chcesz utworzyć jeszcze? [t/n]:"
read pytanie
if [[ $pytanie =~ [yYTt] ]]
then
funkcja_p_ile
fi
}
funkcja_p_ile()
{

	echo "wpisz ile chcesz plików: "
	read liczba1
	for (( c=1 ; c<=$liczba1 ; c++))
	do
		touch plik$c
	done
}

	echo "Witaj , ile chcesz plików: "
funkcja_p_ile
funkcja_czy_jeszcze

echo utworzono $liczba1 plików.


# w następnej wersji można by zastosować zew.
# funkce np; source ~/naszplik_z_funkcjami
# np; na inne możliwe pliki do tworzenia
