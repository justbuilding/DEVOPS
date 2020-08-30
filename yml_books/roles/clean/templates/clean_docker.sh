#!/bin/bash
cd `dirname $0`

systemctl stop docker
rm -f /etc/systemd/system/docker.service
rm -rf /etc/docker/
for i in `cat docker_rpm.txt`
do
rpm -e --nodeps ${i%.*}
done
systemctl daemon-reload

