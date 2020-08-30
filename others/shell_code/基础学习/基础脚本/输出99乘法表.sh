#!/bin/bash

for i in {1..9}
	do 
		for j in {1..9}
			do 
				if [ $j -le $i ];then
				Tt=$[$i*$j]
				echo -e " ${j}X${i}=$Tt \c"
				fi
		done
		echo
done
