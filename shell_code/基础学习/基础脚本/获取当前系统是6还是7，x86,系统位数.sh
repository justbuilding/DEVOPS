#获取系统位数
#getconf LONG_BIT
#64
getconf LONG_BIT

# 获取系统架构
# arch
# x86_64
arch

# 获取centos系统版本
#rpm -qi centos-release | grep Version | tr -c -d [:digit:]
#6
rpm -qi centos-release | grep Version | tr -c -d [:digit:]