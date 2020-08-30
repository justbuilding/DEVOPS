#shell脚本-判断系统是Centos6还是7
#通过SHELL脚本自动判断系统是Centos6还是Centos7操作系统

#!/bin/bash
source ~/.bashrc
function killfirewall(){
systemver=`cat /etc/redhat-release|sed -r 's/.* ([0-9]+)\..*/\1/'`
if [[ $systemver = "6" ]];then
echo "当前是Centos6系统,禁用iptables"
service iptables stop
chkconfig iptables off
else 
echo "当前是Centos7系统,禁用firewall"
systemctl disable firewalld
systemctl stop firewalld
fi
}
killfirewall