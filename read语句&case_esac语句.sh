#!/bin/bash
read -p "Do you agree with?yes or no: "  answer
case $answer in
yes|y)
	echo "let's go"
	;;
no|n)
	echo "poor man"
	;;
*)
	echo "your answer is false"
	;;
esac
