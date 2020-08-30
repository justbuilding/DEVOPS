echo "************"
echo "注意：联网"
echo "配置yum源"
echo "************"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
echo "************"
echo "刷新yum源"
echo "************"
yum check-update > /dev/null 2>&1
echo "************"
echo "安装VScode"
echo "************"
sudo yum install code -y > /dev/null 2>&1
echo "************"
echo "安装完成"
echo "************"