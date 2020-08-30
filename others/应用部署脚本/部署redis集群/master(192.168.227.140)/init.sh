# 192.168.227.140(master)
# 192.168.227.139(slaver)
# 192.168.227.141(slaver)
yum -y install gcc;
# 添加用户
useradd redis;
# 解压包
tar -zxvf redis-3.2.3.tar.gz;
# 编译包
cd redis-3.2.3/src/ && make;

#备份etc下的passwd，并限制redis用户登录，编辑/etc/passwd文件，将redis用户的登录shell改为/sbin/nologin：
cp /etc/passwd /etc/passwd.bak
sed -i "s/^redis:x:/#&/" /etc/passwd
echo "redis:x:8002:8002::/home/redis:/sbin/nologin" >> /etc/passwd
echo "************"
echo "初始化成功"
echo "************"