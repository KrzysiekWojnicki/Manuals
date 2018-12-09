#!/bin/bash

r=$(( $RANDOM % 2 ))
echo $r
case $r in 
	0)  l=A.. ;;
	1)  l=B.. ;;
	*) echo niewyobrażalny errrorrr;;
esac
echo $l
echo ---------
a=$(awk '/^'$l'/ { print } ' /usr/share/dict/polish | head -n 10 )
echo $a
lin=$(awk '/^'$l'/ { print } ' /usr/share/dict/polish | wc -l ) 
echo $lin



for (( c=1 ; c<=$lin ; c++))
do
	petla=$(awk '/^'$l'/ { print } ' /usr/share/dict/polish  )


# zlicz ilość wystąpień haseł , tyle razy puść pętle wybierającą N z listy , wybraną wrzuć w tablice
# powienienem wybrać dowolna o przynajmniej 3 znakach długości i wrzucić ją w zmienną 

# sed -n '$=' /usr/share/dict/polish  #podaje sume wierszy
NUM=6
s=$(sed "${NUM}q;d" /usr/share/dict/polish) # wybierze 6 wiersz
echo $s 
