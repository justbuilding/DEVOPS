

## jenkins

官方文档：<https://jenkins.io/zh/doc/pipeline/tour/getting-started/>

安装步骤：

1.下载 Jenkins(http://mirrors.jenkins.io/war-stable/latest/jenkins.war).

2.下载jdk-8u161-linux-x64.tar.gz

链接: https://pan.baidu.com/s/1Qwkc4usBbMHOBPZswA5CEw 提取码: nhqk

3.上传文件到虚拟机的系统

4.获取部署镜像（绑定外网端口为8888）

```
sh create_imges.sh（在已经安docker情况下,安装后会自动进入镜像里）
```

5.配置java环境变量

```
sh /root/java_env.sh
```

6.运行命令 （绑定jenkins内网端口为8080）

```
java -jar jenkins.war --httpPort=8080
```

7.打开浏览器进入链接 `http://虚拟机iP:8888`.

8.按照说明完成安装

》》

查看/root/.jenkins/secrets/initialAdminPassword 文件内容填入文本

》》

安装推荐的插件

》》

打x的插件时网络问题，可以以后再安装

![1575336207058](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1575336207058.png)

![1575336941827](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1575336941827.png)

