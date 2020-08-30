#### 把不同文件夹的文件上传到对应主机上

## 步骤：

1.三台机均执行

> sh init.sh

2.在master机（192.168.227.140）创建master模板，即执行

> sh create_master_templet.sh



3.在slave机把slave_redis.conf.templet最后一行改成自己的master主机的ip地址



4.在slave机（192.168.227.139，192.168.227.141）创建slave模板

> sh create_slave_templet.sh

5.把sentinel.conf.templet按照说明改



说明：

- 一个集群最少需要三个单实例的redis和三个哨兵实例。
- 第1个集群名称为redis1，第2、3...个集群的集群名称依次为redis2、redis3... 。
- 第1个集群的数据目录为/home/redis/redisdata1，第2、3...个集群的数据目录依次为/home/redis/redisdata2、/home/redis/redisdata3... 。
- 第1个集群redis服务器端口为20001，哨兵端口为20002；第n个集群的redis服务器端口和哨兵端口分别为20000 + 2*n - 1、20000 + 2*n。
- 需要提供开发人员的信息是：集群名称、口令和三个哨兵实例的IP、端口。





6.

> （master）上用root用户执行：
>
> ```javascript
> ssh-keygen -t rsa
> ssh-copy-id -i /root/.ssh/id_rsa.pub root@192.168.227.141
> ssh-copy-id -i /root/.ssh/id_rsa.pub root@192.168.227.139
> ```



7.三台机执行

> sh  sentinel.conf.templet.sh



8.执行

