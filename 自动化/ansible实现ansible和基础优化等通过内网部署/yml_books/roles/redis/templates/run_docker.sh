# 重载systemd
systemctl daemon-reload

# 启动docker
systemctl status docker | grep "running"
if [ $? != 0 ]
then
  systemctl start docker
  systemctl enable docker
else
  echo "docker is not running"
fi
