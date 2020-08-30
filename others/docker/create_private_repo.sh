mkdir /mnt/registry
docker run -d -p 5000:5000 --restart=always --name registry -v /mnt/registry:/var/lib/registry registry:2
ip=$(ip a | grep ens33 | grep inet | awk '{print $2}' |sed 's/\/.*//') 
echo "*************************************"
echo "安装私有仓库完成，是否进行验证(y/n)"
echo "*************************************"
read y_or_n
if [ "y_or_n"="y" ];then
    
	docker tag hello‐world:latest localhost:5000/myhellodocker
	docker push localhost:5000/myhellodocker
	echo "到浏览器上访问http://${ip}:5000/v2/myhellodocker/tags/list"
else
    exit
fi


echo "*************************************"
echo "验证成功，是否配置私有仓库证书(y/n)"
echo "*************************************"
read yes_or_no
if [ "yes_or_no"="y" ];then
    mkdir registry && cd registry && mkdir certs && cd certs
	openssl req -x509 -days 3650 -subj '/CN=${ip}:5000/' -nodes -newkey rsa:2048 -keyout domain.key -out domain.crt
	cd .. && mkdir auth
	docker run --entrypoint htpasswd registry:2 -Bbn ruanwen 123456 > auth/htpasswd
	
	
________________________________________________________
 一、配置私有仓库认证 1、查看Docker Registry私有仓库搭建所在服务器地址：ifconfig 例如：服务器地址为：192.168.200.141
2、生成自签名证书（在home目录下执行上述指令后） 要确保Docker Registry本地镜像仓库的安全性，还需要一个安全认证证书，来保证其他 Docker机器不能随意访问该机器上的Docker Registry本地镜像仓库，所以需要在搭建 Docker Registry本地镜像仓库的Docker主机上先生成自签名证书（如果已购买证书就无需 生成），具体操作指令如下。 $ mkdir registry && cd registry && mkdir certs && cd certs $ openssl req ‐x509 ‐days 3650 ‐subj '/CN=192.168.200.162:5000/' \     ‐nodes ‐newkey rsa:2048 ‐keyout domain.key ‐out domain.crt
指令参数说明： ‐x509：x509是一个自签发证书的格式 ‐days 3650：表示证书有效期 192.168.197.141:5000：表示具体部署Docker Registry本地镜像仓库的地址和端口 rsa:2048：是证书算法长度 domain.key和domain.crt：就是生成的证书文件
3、生成用户名和密码 在Docker Registry本地镜像仓库所在的Docker主机上生成自签名证书后，为了确保 Docker机器与该Docker Registry本地镜像仓库的交互，还需要生成一个连接认证的用户名 和密码，使其他Docker用户只有通过用户名和密码登录后才允许连接到Docker Registry本 地镜像仓库 $ cd .. && mkdir auth $ docker run ‐‐entrypoint htpasswd registry:2 ‐Bbn ruanwen 123456 >  auth/htpasswd
4、启动Docker Registry本地镜像仓库服务（将之前创建的容器删除） $ docker run ‐d \   ‐p 5000:5000 \   ‐‐restart=always \   ‐‐name registry \   ‐v /mnt/registry:/var/lib/registry \   ‐v `pwd`/auth:/auth \   ‐e "REGISTRY_AUTH=htpasswd" \   ‐e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \   ‐e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
  ‐v `pwd`/certs:/certs \........




________________________________________________________
else
    exit
fi
 