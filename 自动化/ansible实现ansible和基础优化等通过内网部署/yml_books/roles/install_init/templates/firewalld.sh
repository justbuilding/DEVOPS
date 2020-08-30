#!/bin/bash
systemctl disable firewalld
systemctl stop firewalld
if [[ `systemctl status firewalld | grep running` == 0 ]];then
systemctl stop firewalld
echo "firewalld is stopping"
else
echo "firewalld is stopped"
fi
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
setenforce 0

