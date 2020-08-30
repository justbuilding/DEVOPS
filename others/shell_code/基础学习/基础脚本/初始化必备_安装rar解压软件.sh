# 解压：
# rar x test.rar //解压 test.rar 到当前目录
# unrar -e test.tar
# 压缩：
# rar test.rar ./test/ //将 test目录打包为 test.rar

wget http://www.rarlab.com/rar/rarlinux-x64-5.3.0.tar.gz
tar -zxvf rarlinux-x64-5.3.0.tar.gz
cd rar
make
cd ..
