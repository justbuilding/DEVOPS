#!/bin/bash

for i in `ls -A /var`
do
Type=$(ls -ld /var/$i |  head -c 1)
case $Type in
	-)
	 	echo -e " THE type of \033[31;1m $i \033[0m is a file or a hardlink file  "
		;;
	d)
		echo -e " THE type of \033[31;1m $i \033[0m  is a drictory"
		;;
	l)
		echo -e " THE type of \033[31;1m $i \033[0m is a link "
		;;
	b)
		echo -e " THE type of \033[31;1m $i \033[0m  is a block file"
		;;
	c)
		echo -e " THE type of \033[31;1m $i \033[0m is a chart file "
		;;
	p)
		echo -e " THE type of \033[31;1m $i \033[0m is a pipe file  "
		;;
	s)
		echo -e " THE type of \033[31;1m $i \033[0m  is a socket file "
		;;
	*)
		echo "Where is wrong??"
esac
done
