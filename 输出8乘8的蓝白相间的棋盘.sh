#!/bin/bash

Color1="\e[44m  \e[0m"
Color2="\e[47m  \e[0m"
for i in {1..8}
do 
    if [ $[ $i % 2 ] -eq 1 ]
    then
        OddCellColor=$Color1
        EvenCellColor=$Color2
    else
        OddCellColor=$Color2
        EvenCellColor=$Color1
    fi

    for x in {1..8}
    do
        if [ $[ $x % 2 ] -eq 1 ]
        then
            echo -e "$OddCellColor\c"
        else
            echo -e "$EvenCellColor\c"
        fi
    done
    echo 
done
