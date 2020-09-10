#!/bin/bash
cd `dirname $0`
dockerd --iptables=false >/dev/nul 2>&1 &
sleep 1
docker start {{redis_node_name}} >/dev/nul 2>&1
if [ "$?" != "0" ]
then
docker load -i redis.tar
if [ "{{redis_node_name}}" == "redis_sentinel" ]
then
docker run --restart=always --name {{redis_node_name}} -v {{work_dir}}:/data/redis --network host -d c7b388ce3d39 redis-server /data/redis/redis.conf --sentinel
else
docker run --restart=always --name {{redis_node_name}} -v {{work_dir}}:/data/redis --network host -d c7b388ce3d39 redis-server /data/redis/redis.conf
fi
fi
