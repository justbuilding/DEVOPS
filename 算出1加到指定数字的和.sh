#!/bin/bash

Sum=0
read -p "please input a num for sum :" Num1
[ -z "$Num1" ] && { echo " input a num "; exit 110; }
echo $Num1 | grep "[^0-9]" &> /dev/null  && { echo " the $Num1 is not zhenghengshu"; exit 112; }
[ $Num1 -eq 0 ] &&  { echo "  $Num1 is 0"; exit 113; }
for i in `seq 1 $Num1`
	do
		Sum=$[$Sum+$i]	
	done
echo "The Sum of 1 to $Num1 is $Sum"		
