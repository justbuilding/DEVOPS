#!/bin/bash
echo "user:"
read user
echo "passwd:"
read passwd
if [ "$user"="hjj" ] && [ "$passwd" = "123456" ];then
    echo "SUCCESS"
else
    echo "user name or passwd ERROR"
fi