#!/bin/bash
cd `dirname $0`


for file in `ls pkg/ansible/`
do
#echo "${file%.*}"
#echo "${file##*.}"
rpm -e --nodeps ${file%.*}
done
