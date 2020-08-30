maxdir=`ls -l /home/redis | grep "redisdata" | awk '{print $9}' | sort -k1.10n | tail -n1`
maxnum=`expr ${maxdir:9} + 1`
datadir='/home/redis/redisdata'${maxnum}
clustername='redis'${maxnum}
redis_port=$((20000+maxnum*2-1))
sentinel_port=$((20000+maxnum*2))

mkdir ${datadir}
cp /home/redis/redis.conf.templet ${datadir}/redis.conf
cp /home/redis/sentinel.conf.templet ${datadir}/sentinel.conf

sed -i "s/20001/$redis_port/g" ${datadir}/redis.conf
sed -i "s/redisdata1/redisdata$maxnum/g" ${datadir}/redis.conf

sed -i "s/20002/$sentinel_port/g" ${datadir}/sentinel.conf
sed -i "s/20001/$redis_port/g" ${datadir}/sentinel.conf
sed -i "s/redis1/$clustername/g" ${datadir}/sentinel.conf
sed -i "s/redisdata1/redisdata$maxnum/g" ${datadir}/sentinel.conf

chown -R redis:redis ${datadir}
chmod 775 ${datadir}
chmod 664 ${datadir}/*

sudo -u redis /home/redis/redis-3.2.3/src/redis-server ${datadir}/redis.conf
sudo -u redis /home/redis/redis-3.2.3/src/redis-sentinel ${datadir}/sentinel.conf > ${datadir}/sentinel.log 2>&1 &
