#!/bin/bash

for i in {1..10}
do 
    Num=$RANDOM
    echo $Num
    if [ $i -eq 1 ]
    then 
        Min=$Num
        Max=$Num
        continue
    fi 

    if [ $Num -gt $Max ]
    then 
        Max=$Num
    elif [ $Num -lt $Min ]
    then 
        Min=$Num
    fi
done

echo "The max num is ${Max}. The min num is ${Min}."
