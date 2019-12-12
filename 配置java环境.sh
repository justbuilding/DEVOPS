echo "*******************************************"
echo "配置环境变量到/etc/profile"
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