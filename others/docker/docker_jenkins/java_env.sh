echo "*******************************************"
echo "正在解压中"
echo "*******************************************"
tar -zxvf /root/jdk-8u161-linux-x64.tar.gz -C /usr/local/>/dev/null 2>&1

echo "*******************************************"
echo "解压完成"
echo "*******************************************"
echo "*******************************************"
echo "正在备份和配置环境变量中"
## export JRE_HOME=/usr/local/jdk1.8.0_161/jre和export JAVA_HOME=/usr/local/jdk1.8.0_161
##必须放在setclasspath.sh前面，否则会报错找不到jdk和jre
echo "*******************************************"
echo "配置环境变量到/etc/profile"
cp /etc/profile{,.bak}
echo "JAVA_HOME=/usr/local/jdk1.8.0_161">>/etc/profile;
echo "export CLASSPATH=.:\${JAVA_HOME}/jre/lib/rt.jar:\${JAVA_HOME}/lib/dt.jar:\${JAVA_HOME}/lib/tools.jar">>/etc/profile;
echo "export PATH=\$PATH:\${JAVA_HOME}/bin">>/etc/profile;
sudo source /etc/profile
if [ $? -ne 0 ]; then
    echo "配置java环境出错"
else
    echo "配置java环境成功"
fi
echo "请输入source /etc/profile激活环境变量配置"