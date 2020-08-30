### DSL语法：

##### 用于编写dockerfile，dockerfile能够将一个新的镜像构建出来

##### 官方文档

<https://docs.docker.com/v17.09/engine/reference/builder/#using-arg-variables>



##### 基本信息

FROM             基础镜像

MAINTAINER 维护者信息

RUN               安装软件

ADD               COPY文件，会自动解压

WORKDIR      cd 切换目录

VOLUME        目录挂载

EXPOSE          内部服务端口

CMD               执行Dockerfile中的命令

ENV                设置环境变量



##### 案例

#Verson 1.0
#父镜像
FROM ubuntu:latest

#维护者信息
MAINTAINER JayQ "xxx@163.com"

#设置root用户为后续命令的执行者
USER root

#执行操作
RUN apt-get update
RUN apt-get install -y nginx

#使用&&拼接命令
RUN touch test.txt && echo "a" >> a.txt

#对外暴露端口
EXPOSE 80 8080 1038

#添加文件
ADD a.txt /opt/

#添加文件夹
ADD /webapp /opt/webapp

#添加网络文件
ADD https://www.baidu.com/img/bd_logo1.png /opt/

#设置环境变量
ENV WEBAPP_PORT=9090

#设置工作目录
WORKDIR /opt/

#设置启动命令
ENTRYPOINT ["ls"]

#设置启动参数
CMD ["-a", "-l"]

#设置卷
VOLUME ["/data", "/var/www"]

#设置子镜像的触发操作
ONBUILD ADD ./app/src
ONBUILD RUN echo "on build excuted" >> onbuild.txt
