#!/bin/bash
echo "(1)************************************"
#date显示时间,w显示当前用户信息
date;
echo "Active User:"
w
echo "(2)*************************************************"
#显示cpu使用情况
echo "Linux process:"
top -b | head -6
echo "(3)*************************************************"
#显示df硬盘和free内存利用率,xargs把参数格式重新组合,这样输出时避免参数列表过长
echo "Disk and Memory use ratio:"
df -h |xargs | awk '{print "Free/total disk: "$11"/"$9}'
free -m |xargs | awk '{print "Free/total memory: "$17"/"$8"MB"}'
echo "(4)*************************************************"
echo "ALL Processes:"
#显示终端所有进程
ps auxf
echo "(5)*************************************************"
#显示虚拟内存的统计信息
echo "vmstat:"
vmstat 1 5
echo "(6)*************************************************"
#扫描192.168.227整个网段查看在线主机信息，需yum install nmap
echo "Scan the entire subnet:"
nmap 192.168.227.*
echo "(7)*************************************************"
#查看每个进程打开的具体scoket
echo "socket for each process:"
ss -pl