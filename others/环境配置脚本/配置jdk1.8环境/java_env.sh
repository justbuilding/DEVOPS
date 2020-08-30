echo "*******************************************"
echo "解压到/usr/local/jdk1.8.0_211"
echo "*******************************************"
tar -xvf jdk-8u211-linux-x64.tar.gz -C /usr/local/



echo "*******************************************"
echo "配置环境变量到/etc/profile"
cp /etc/profile{,.bak}
echo "JAVA_HOME=/usr/local/jdk1.8.0_211">>/etc/profile;
echo "export CLASSPATH=.:\${JAVA_HOME}/jre/lib/rt.jar:\${JAVA_HOME}/lib/dt.jar:\${JAVA_HOME}/lib/tools.jar">>/etc/profile;
echo "export PATH=\$PATH:\${JAVA_HOME}/bin">>/etc/profile;
sh source.sh
java -version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "配置java环境出错"
else
    echo "配置java环境成功"
fi
