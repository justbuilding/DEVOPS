#!/bin/bash

for i in user{1..10}
do	
	useradd $i &> /dev/null && echo "$i is created"
	Passwd=`tr -dc "[:alnum:]" < /dev/urandom | head -c 10`
	echo "$Passwd" | passwd --stdin $i
	touch passwd.txt
	echo "$i:$Passwd" >> passwd.txt
done