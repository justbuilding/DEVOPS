#!/bin/bash
read -p " please input  a num : " Num

[ -z "$Num" ] && { echo " input a num "; exit 110; }
echo $Num | grep "[^0-9]" &> /dev/null  && { echo " the $Num is not 正整数"; exit 112; }
[ $Num -eq 0 ] &&  echo "  $Num is 0" || echo " $Num is 正整数"
