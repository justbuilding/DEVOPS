#!/bin/bash
# 获取系统是centos6还是7等
sys_byte=$(rpm -qi centos-release | grep Version | tr -c -d [:digit:])

yum install wget -y

# 备份原先的yum
cd /etc/yum.repos.d/
mv /etc/yum.repos.d/CentOS-Base.repo  /etc/yum.repos.d/CentOS-Base.repo.$(date -d "today" +"%Y%m%d_%H%M%S")

# 获取163repo并命名为CentOS-Base.repo
wget http://mirrors.163.com/.help/CentOS$sys_byte-Base-163.repo &&  mv CentOS$sys_byte-Base-163.repo CentOS-Base.repo

yum install yum-plugin-fastestmirror -y

# 配置epel源
yum install -y epel-release
