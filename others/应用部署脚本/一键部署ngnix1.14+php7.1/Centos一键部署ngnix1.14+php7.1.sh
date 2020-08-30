#!/bin/bash
#Configuration file path(配置文件路径)
NGINX_CFP=/usr/local/nginx/conf/nginx.conf
NGINX_BAK=/usr/local/nginx/conf/nginx.conf.bak
PHP_CFP=/usr/local/php/etc/php-fpm.conf
PHP_CFPY=./php-7.1.29/sapi/fpm/php-fpm.conf
PHP_DEFAULT=/usr/local/php/etc/php-fpm.d/www.conf.default
PHP_CONF=/usr/local/php/etc/php-fpm.d/www.conf
#Startup path(启动路径)
NGINX_SP=/usr/local/nginx/sbin/nginx
PHP_SP=/usr/local/php/sbin/php-fpm

#nginx + php7.1 部署环境
#nginx-1.14.2.tar.gz php-7.1.30.tar.gz 选择源码包安装
#安装依赖包
yum -y install gcc automake autoconf libxml2-devel libtool make gcc gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel

#下载nginx php7.1 源码包
yum -y install wget 
wget http://nginx.org/download/nginx-1.14.2.tar.gz
if [ $? -eq 0 ];then
echo “-------------nginx安装成功-------------------------”
else
echo “-------------nginx安装失败-------------------------”
exit
fi
wget http://ahdx.down.chinaz.com/201905/php_v7.1.29.tar.gz
if [ $? -eq 0 ];then
echo “-------------php7.1安装成功-------------------------”
else
echo “-------------php7.1安装失败-------------------------”
exit
fi
#解压源码包
tar -xf nginx-1.14.2.tar.gz && echo “-----解压成功-------”
tar -xf php_v7.1.29.tar.gz && echo “-----解压成功-------”
#编译安装nginx
cd nginx-1.14.2
./configure
make && make install
#编译安装php7.1
cd …/php-7.1.29
./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm
make && make install
cp $PHP_CFPY $PHP_CFP
cp $PHP_DEFAULT $PHP_CONF
#备份nginx的配置文件
cp $NGINX_CFP $NGINX_BAK
#利用sed工具修改nginx的配置文件
sed -i ‘/1*index/a\ if ( -f $request_filename){\n break;\n }\n if ( !-e KaTeX parse error: Expected '}', got '\n' at position 20: …est_filename) {\̲n̲ ̲rewrite ^(.*) /index.php/$1 last;\n break;\n }\n }’ $NGINX_CFP && echo “--------------修改成功------------------”
sed -i 73,79d $NGINX_CFP && echo “--------------修改成功------------------”

sed -i ‘N;72a\ location ~ .php$ {\n root html/public;\n fastcgi_pass 127.0.0.1:9000;\n fastcgi_index index.php;\n fastcgi_split_path_info ^(.+.php)(/.+)$;\n fastcgi_param PATH_INFO KaTeX parse error: Expected 'EOF', got '\n' at position 19: …tcgi_path_info;\̲n̲ ̲fastcgi_param …fastcgi_script_name;\n fastcgi_param PATH_TRANSLATED documentrootdocument_rootdocument 
r
​	
 ootfastcgi_path_info;\n include fastcgi_params;\n }’ $NGINX_CFP && echo “--------------修改成功------------------”
#启动nginx php服务
$NGINX_SP
$PHP_SP
ss -ntulp | grep 80 && ss -ntulp | grep 9000
if [ $? -eq 0 ];then
echo “-------------Nginx and Php 服务启动成功-------------------------”
else
echo “-------------Nginx and Php 服务启动失败-------------------------”
exit
fi
