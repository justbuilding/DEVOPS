set -uexo pipefail
echo "*******************************************"
echo "正在解压中"
echo "*******************************************"
tar -zxvf /root/jdk-8u161-linux-x64.tar.gz -C /usr/local/>/dev/null 2>&1
tar -zxvf /root/apache-tomcat-7.0.47.tar.gz -C /usr/local/>/dev/null 2>&1
echo "*******************************************"
echo "解压完成"
echo "*******************************************"
echo "*******************************************"
echo "正在备份和配置环境变量中"
## export JRE_HOME=/usr/local/jdk1.8.0_161/jre和export JAVA_HOME=/usr/local/jdk1.8.0_161
##必须放在setclasspath.sh前面，否则会报错找不到jdk和jre
echo "*******************************************"
#配置环境变量到/etc/profile
cp /etc/profile{,.bak}
echo "JAVA_HOME=/usr/local/jdk1.8.0_161">>/etc/profile;
echo "export CLASSPATH=.:\${JAVA_HOME}/jre/lib/rt.jar:\${JAVA_HOME}/lib/dt.jar:\${JAVA_HOME}/lib/tools.jar">>/etc/profile;
echo "export PATH=\$PATH:\${JAVA_HOME}/bin">>/etc/profile;
source /etc/profile
java -version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "配置java环境出错"
else
    echo "配置java环境成功"
fi
#配置环境变量到/usr/local/apache-tomcat-7.0.47/bin/setclasspath.sh
echo "备份，配置环境变量到/usr/local/apache-tomcat-7.0.47/bin/setclasspath.sh"
cp /usr/local/apache-tomcat-7.0.47/bin/setclasspath.sh{,.bak}
sed -i '1 a\export JAVA_HOME=/usr/local/jdk1.8.0_161' /usr/local/apache-tomcat-7.0.47/bin/setclasspath.sh
sed -i '1 a\export JRE_HOME=/usr/local/jdk1.8.0_161/jre' /usr/local/apache-tomcat-7.0.47/bin/setclasspath.sh
echo "*************************************************************************************"
echo "全部完成，echo $PATH"
echo "输入java -version有版本输出即可以"
echo "*************************************************************************************"
echo "*************************************************************************************"
echo "备份，配置ip，允许访问server status和manager app 和host manager按钮"
cp /usr/local/apache-tomcat-7.0.47/webapps/manager/META-INF/context.xml{,.bak}
cp /usr/local/apache-tomcat-7.0.47/webapps/host-manager/META-INF/context.xml{,.bak}
sed -i '/<\/Context>/i\<Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="^.*$" />' /usr/local/apache-tomcat-7.0.47/webapps/manager/META-INF/context.xml
sed -i '/<\/Context>/i\<Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="^.*$" />' /usr/local/apache-tomcat-7.0.47/webapps/host-manager/META-INF/context.xml
echo "*************************************************************************************"
echo "备份，准备配置密码"
cp /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml{,.bak}
sed -i '/<\/tomcat-users>/i\<role rolename="admin"/>'  /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<role rolename="manager-script"/>'  /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<role rolename="manager-gui"/>'  /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<role rolename="manager-jmx"/>'  /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<role rolename="manager-status"/>'  /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<role rolename="admin-gui"/>'  /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<role rolename="admin-script"/>'  /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml
sed -i '/<\/tomcat-users>/i\<user username="admin" password="admin" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-gui,admin-script"/>'  /usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml
echo "配置/usr/local/apache-tomcat-7.0.47/conf/tomcat-users.xml成功,这个文件用于设置密码"
echo "已经配置账号密码为admin，admin"
echo "*************************************************************************************"