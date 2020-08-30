#!/bin/bash
Check_D=`df |grep "/sd" |tr -s " " "%" |cut -d% -f5 |sort -n |tail -1`
[ $Check_D -gt 80 ] && wall the disk is full

