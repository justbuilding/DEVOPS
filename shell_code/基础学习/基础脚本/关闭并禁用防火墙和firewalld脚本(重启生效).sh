echo "正在配置防火墙……"
systemctl stop firewalld > /dev/null 2>&1
systemctl disable firewalld  > /dev/null 2>&1
if [ $? -eq 0 ];then
echo "防火墙初始化完毕！"
fi
 
echo "正在关闭SELinux……"
setenforce 0 > /dev/null 2>&1
sed -i '/^SELINUX=/s/=.*/=disabled/' /etc/selinux/config
if [ $? -eq 0 ];then
        echo "SELinux初始化完毕！"
fi