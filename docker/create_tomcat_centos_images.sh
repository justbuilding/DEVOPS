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
echo "*******************************************"
echo -e "JAVA_HOME=/usr/local/jdk1.8.0_161\nexport PATH=$JAVA_HOME/bin:$PATH">>/etc/profile
echo -e "export JAVA_HOME=/usr/local/jdk1.8.0_161\nexport JRE_HOME=/usr/local/jdk1.8.0_161/jre">>/usr/local/apache-tomcat-7.0.47/bin/setclasspath.sh
echo "*******************************************"
echo "全部完成"
echo "*******************************************"