#!/bin/bash
file=~/dupa
# set field separator to a single white space 
while IFS=' ' read -r -d $'\0' file
do
	echo "field # 1 : $file ==> field #2 : $file"
done < "$file"
