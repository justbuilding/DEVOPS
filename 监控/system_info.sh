#!/usr/bin/bash
#Program function system_info
resettem=$(tput sgr0)
# Check OS Type
	Os=$(hostnamectl |awk -F":" '/Operating System/ {print $2}')
	echo -e "\e[1;35m" "当前的系统版本-->" "${resettem}""${Os}"
# Check Kernel Release
	Os_kernel=$(hostnamectl |awk -F":" '/Kernel/ {print $2}')
	echo -e "\e[1;35m" "当前的系统内核-->" "${resettem}""${Os_kernel}"
# Check Architecture
	Os_Arch=$(hostnamectl |awk -F":" '/Architecture/ {print $2}')
	echo -e "\e[1;35m" "当前的系统平台-->" "${resettem}""${Os_Arch}"
# Check Hostname
	Os_HostName=$(hostnamectl |awk -F":" '/Static hostname/ {print $2}')
	echo -e "\e[1;35m" "当前的系统名称-->" "${resettem}""${Os_HostName}"
# Check Internal IP
	Internalip=$(hostname -I)
	echo -e "\e[1;35m" "当前的内网IP-->" "${resettem}""${Internalip}"
# Check External IP
	Externalip=$(curl -s  icanhazip.com)
	echo -e "\e[1;35m" "当前的外网IP-->" "${resettem}""${Externalip}"
# Check DNS Name
	NameServer=$(awk "/nameserver/{print $2}" /etc/resolv.conf)
	echo -e "\e[1;35m" "当前的DNS-->" "${resettem}""${NameServer}"
# Check if connected to Internet or not
	ping -c2 xuliangwei.com &>/dev/null && \
	echo -e "\e[1;35m" "当前网络畅通-->" "${resettem}""Connected" || \
	echo -e "\e[1;35m" "当前网络阻塞-->" "${resettem}""Disconnected"
# Check Logged In Users
	who>/tmp/who
	echo -e "\e[1;35m" "用户状态信息-->" "${resettem}"  && \
	cat /tmp/who && rm -f /tmp/who

# Check System Free 
	system_mem_usages=$(free -mh|awk '/Mem/{print $NF}')
	echo -e "\e[1;35m" "系统可用内存-->" "${resettem}""${system_mem_usages}"
# Check System Load
	loadaverge=$(top -n 1 -b|awk '/load/{print $12,$13,$14}')
	echo -e "\e[1;35m" "系统负载状态-->" "${resettem}""${loadaverge}"
# Chkek Disk 
	DiskStatus=$(df -h|awk '!/(Filesystem|tmpfs|boot)/')
	echo -e "\e[1;35m" "系统磁盘状态-->" "${resettem}""${DiskStatus}"
	


