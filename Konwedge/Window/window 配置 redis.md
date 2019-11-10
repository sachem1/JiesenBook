### Redis简介

> https://www.jianshu.com/p/c869feb5581d?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation   

```
1.Redis 集群的键空间被分割为16383个槽，集群的最大节点数也是16484个
2.

```
#### 下载redis server
> https://github.com/ServiceStack/redis-windows  
window 的需要到github里面下载

#### 部署
> 1.傻瓜安装Redis Server

> 2.修改Redis Server 默认配置
```
1.修改密码: 查找 requirepass 在下面添加 requirepass '密码'
2.修改默认最大内存: 查找 # maxmemory 在下面添加 maxmemory 1024000000 (1G内存)
3.

```

> 3.启动Redis Server
```
1.cmd
2.切换到Redis安装目录 
3.redis-server.exe redis.windows.conf

如果报错,执行如下步骤:
1. redis-cli.exe
2. shutdown
3. exit
4. redis-server.exe redis.windows.conf

```
> 4. 客户端访问
```
1.cmd 切换到Redis目录
2.redis-cli.exe
3.set key 123
4.get key

```

#### 配置redis 的windows 服务
> redis-server –service-install redis.windows.conf –loglevel verbose
---

### window Redis 集群
> https://www.jianshu.com/p/26e61d1161af
```
如果master设置了验证密码，还需配置masterauth。master设置了验证密码为admin，所以配置masterauth admin。

```
#### 准备集群配置文件
```
1.在Redis安装目录添加集群文件夹 cluster
2.在文件夹内建立5个子文件夹(三主三从)[redis选举机制,如果超过半数失效,集群宕机]
3.分别启动6个redis节点服务
4.通过Ruby命令端安装Redis
5.将redis-trib.rb 文件复制到Redis安装目录
6.创建Redis集群服务
7.集群下只有一个db0
```


> 安装服务
```
1.安装命令
redis-server --service-install cluster/7100/redis.7100.conf --service-name redis7100
2.卸载命令
redis-server --service-uninstall --service-name redis7100

3.启动命令
redis-server --service-start --service-name redis7100

4.停止命令
redis-server --service-stop --service-name redis7100

```
其他命令

```
1.安装
redis-server --service-install cluster/7101/redis.7101.conf --service-name redis7101
redis-server --service-install cluster/7200/redis.7200.conf --service-name redis7200
redis-server --service-install cluster/7201/redis.7201.conf --service-name redis7201
redis-server --service-install cluster/7300/redis.7300.conf --service-name redis7300
redis-server --service-install cluster/7301/redis.7301.conf --service-name redis7301
2.配置集群
redis-trib.rb create --replicas 1 127.0.0.1:7100 127.0.0.1:7200 127.0.0.1:7300 127.0.0.1:7101 127.0.0.1:7201 127.0.0.1:7301

3.查看集群
redis-cli -c -h 127.0.0.1 -p 7100 cluster nodes

4.客户端登录集群命令（参数顺序无所谓，-h：ip地址 | -p：端口 | -c：集群标识）
redis-cli -c -p 7200 -h 127.0.0.1

5.测试

```



### 哨兵
> https://www.cnblogs.com/huangfuyuan/p/9880379.html

> 原理
哨兵(sentinel) 是一个分布式系统,你可以在一个架构中运行多个哨兵(sentinel) 进程,这些进程使用流言协议(gossipprotocols)来接收关于Master是否下线的信息,并使用投票协议(agreement protocols)来决定是否执行自动故障迁移,以及选择哪个Slave作为新的Master.
```
优点:
1.监控
2.故障转移


缺点:
1.主从服务器的数据要经常进行主从复制，这样造成性能下降。

2.当主服务器宕机后，从服务器切换成主服务器的那段时间，服务是不能用的。
```
一致性哈希算法 分配数据到固定的集群节点.



### 节点配置
几个配置的点
```
# 后台运行
daemonize yes
# 开启aof
appendonly yes
# 最大内存
maxmemory 200mb
# 缓存删除机制
maxmemory-policy allkeys-lru
# 开启集群
cluster-enabled yes
# 集群连接超时时间
cluster-node-timeout 15000
# 
cluster-slave-validity-factor 10
cluster-migration-barrier 1
cluster-require-full-coverage yes

allkeys-lru: 尝试回收最少使用的键（LRU），使得新添加的数据有空间存放。
volatile-lru: 尝试回收最少使用的键（LRU），但仅限于在过期集合的键,使得新添加的数据有空间存放。

```

注释
```
cluster-config-file nodes-6379.conf 集群配置文件的名称，每个节点都有一个集群相关的配置文件，持久化保存集群的信息。这个文件并不需要手动配置，这个配置文件有Redis生成并更新，每个Redis集群节点需要一个单独的配置文件，请确保与实例运行的系统中配置文件名称不冲突。

cluster-node-timeout 15000 节点互连超时的阀值。集群节点超时毫秒数。即节点与集群其他节点断开多长时间将被认定为超时。建议稍微大一点

cluster-slave-validity-factor 10 在进行故障转移的时候，全部slave都会请求申请为master，但是有些slave可能与master断开连接一段时间了，导致数据过于陈旧，这样的slave不应该被提升为master。该参数就是用来判断slave节点与master断线的时间是否过长。判断方法是：比较slave断开连接的时间和(node-timeout * slave-validity-factor)+ repl-ping-slave-period如果节点超时时间为三十秒, 并且slave-validity-factor为10,假设默认的repl-ping-slave-period是10秒，即如果超过310秒slave将不会尝试进行故障转移

cluster-migration-barrier 1 master的slave数量大于该值，slave才能迁移到其他孤立master上，如这个参数若被设为2，那么只有当一个主节点拥有2个可工作的从节点时，它的一个从节点才会尝试迁移。

cluster-require-full-coverage yes 默认情况下，集群全部的slot有节点负责，集群状态才为ok，才能提供服务。设置为no，可以在slot没有全部分配的时候提供服务。不建议打开该配置，这样会造成分区的时候，小分区的master一直在接受写请求，而造成很长时间数据不一致。

```

### 手动新增节点


