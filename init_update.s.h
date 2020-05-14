echo "*******************************************************************************"
echo "更新yum缓存……"
echo "*******************************************************************************"

yum update -y


if [ $? -ne 0 ]; then
    echo "update failed"
else
    echo "update succeed"
fi

echo "*******************************************************************************"
echo "安装压缩软件rar和unzip,zip……"
echo "*******************************************************************************"
wget http://www.rarlab.com/rar/rarlinux-x64-5.3.0.tar.gz
tar -zxvf rarlinux-x64-5.3.0.tar.gz
cd rar
make
cd ..
echo "安装rar成功"
yum install -y unzip zip
echo "安装unzip,zip成功"
