echo "*******************************************"
echo "正在解压中"
echo "*******************************************"
tar -zxvf /root/jdk-8u161-linux-x64.tar.gz -C /usr/local/>/dev/null 2>&1
tar -zxvf /root/apache-tomcat-7.0.47.tar.gz -C /usr/local/>/dev/null 2>&1
echo "*******************************************"
echo "解压完成"
echo "*******************************************"
echo "*******************************************"
echo "正在配置环境变量中"
## export JRE_HOME=/usr/local/jdk1.8.0_161/jre和export JAVA_HOME=/usr/local/jdk1.8.0_161
##必须放在setclasspath.sh前面，否则会报错找不到jdk和jre
echo "*******************************************"
echo -e "JAVA_HOME=/usr/local/jdk1.8.0_161">>/etc/profile
echo "export CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar">>/etc/profile
echo "export PATH=$PATH:${JAVA_HOME}/bin">>/etc/profile

export 
export 
sed -i '1 a\export JAVA_HOME=/usr/local/jdk1.8.0_161' /usr/local/apache-tomcat-7.0.47/bin/setclasspath.sh
sed -i '1 a\export JRE_HOME=/usr/local/jdk1.8.0_161/jre' /usr/local/apache-tomcat-7.0.47/bin/setclasspath.sh
source /etc/profile
echo "*******************************************"
echo "全部完成，echo $PATH"
echo "看有没/usr/local/jdk1.8.0_161/bin"
echo "有则设置环境变量成功"
echo "cat usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml | grep pass"
echo "可以查看修改密码，其中一个账号密码为"
echo "username="tomcat" password="tomcat""
echo "*******************************************"