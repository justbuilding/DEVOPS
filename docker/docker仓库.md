## docker仓库

Docker仓库（Repository）类似与代码仓库，是Docker集中存放镜像文件的地方。 

##### docker hub 

1.打开https://hub.docker.com/ 

2、注册账号：略 

3、创建仓库（Create Repository）：略 

4、设置镜像标签 docker tag local‐image:tagname new‐repo:tagname（设置tag） eg:docker tag hello‐world:latest 108001509033/test‐hello‐world:v1 

5、登录docker hub docker login(回车，输入账号以及密码)

6、推送镜像 docker push new‐repo:tagname eg：docker push 108001509033/test‐hello‐world:v1



##### 阿里云 (参考官方文档)

步骤：

1、创建阿里云账号 

2、创建命名空间 

3、创建镜像仓库 

4、操作指南 

$ sudo docker login ‐‐username=[账号名称] registry.cnhangzhou.aliyuncs.com

$ sudo docker tag [ImageId] registry.cnhangzhou.aliyuncs.com/360buy/portal:[镜像版本号] 

$ sudo docker push registry.cn‐hangzhou.aliyuncs.com/360buy/portal:[镜像版 本号]



##### 搭建私有仓库 
2.3.1 构建私有仓库 
1、打开https://hub.docker.com/ 

2、注册账号：略 

3、创建仓库（Create Repository）：略 

4、设置镜像标签 

docker tag local‐image:tagname new‐repo:tagname（设置tag） 

eg:docker tag hello‐world:latest 108001509033/test‐hello‐world:v1 

5、登录docker hub docker login(回车，输入账号以及密码) 

6、推送镜像 

docker push new‐repo:tagname 

eg：docker push 108001509033/test‐hello‐world:v1