# 卸载docker旧版本
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
				  
#Install required packages. yum-utils provides the yum-config-manager utility, and device-mapper-persistent-data and lvm2 are required by the devicemapper storage driver.
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
  
#set up the stable repository
 sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#Install the latest version of Docker Engine - Community and containerd, or go to the next step to install a specific version:
sudo yum install docker-ce docker-ce-cli containerd.io
#If prompted to accept the GPG key, verify that the fingerprint matches 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35, and if so, accept it.
#Got multiple Docker repositories?
#If you have multiple Docker repositories enabled, installing or updating without specifying a version in the yum install or yum update command always installs the highest possible version, which may not be appropriate for your stability needs.
#Docker is installed but not started. The docker group is created, but no users are added to the group.
#To install a specific version of Docker Engine - Community, list the available versions in the repo, then select and install:
#a. List and sort the versions available in your repo. This example sorts results by version number, highest to lowest, and is truncated:
yum list docker-ce --showduplicates | sort -r
#docker-ce.x86_64  3:18.09.1-3.el7                     docker-ce-stable
#docker-ce.x86_64  3:18.09.0-3.el7                     docker-ce-stable
#docker-ce.x86_64  18.06.1.ce-3.el7                    docker-ce-stable
#docker-ce.x86_64  18.06.0.ce-3.el7                    docker-ce-stable
#The list returned depends on which repositories are enabled, and is specific to your version of CentOS (indicated by the .el7 suffix in this example).
#b. Install a specific version by its fully qualified package name, which is the package name (docker-ce) plus the version string (2nd column) starting at the first colon (:), up to the first hyphen, separated by a hyphen (-). For example, docker-ce-18.09.1.
sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
#Docker is installed but not started. The docker group is created, but no users are added to the group.
#Start Docker.
sudo systemctl start docker
#Verify that Docker Engine - Community is installed correctly by running the hello-world image.
sudo docker run hello-world
echo "****************************"
echo "安装完成,如果前面出现Hello from Docker!
This message shows that your installation appears to be working correctly.表示测试运行docker的hello程序成功"
echo "****************************"
echo "如果想要启用docker-ce-nightly和docker-ce-test使用如下指令，默认不启用"
echo "sudo yum-config-manager --enable docker-ce-nightly"
echo "sudo yum-config-manager --enable docker-ce-test"