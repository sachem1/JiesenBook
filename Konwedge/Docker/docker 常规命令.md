### docker 一些命令


##### 设置docker自启动
> systemctl enable docker

##### docker 的启动,停止,重启
> service docker start  
service docker stop  
service docker restart  

##### docker 搜索镜像
> docker search <image>

##### docker 下载镜像
> docker pull <image>

> 列出所有images docker images  
包含历史的 docker images -a  
显示镜像的所有层  docker images --tree  
删除一个或多个镜像 docker rmi <image ID>  

##### 运行一个实例
```
Usage: docker run [OPTIONS] IMAGE [COMMAND] [ARG...]  
 
  -d, --detach=false         指定容器运行于前台还是后台，默认为false   
  -i, --interactive=false    打开STDIN，用于控制台交互  
  -t, --tty=false            分配tty设备，该可以支持终端登录，默认为false  
  -u, --user=""              指定容器的用户  
  -a, --attach=[]            标准输入输出流和错误信息（必须是以非docker run -d启动的容器）
  -w, --workdir=""           指定容器的工作目录 
  -c, --cpu-shares=0         设置容器CPU权重，在CPU共享场景使用  
  -e, --env=[]               指定环境变量，容器中可以使用该环境变量  
  -m, --memory=""            指定容器的内存上限  
  -P, --publish-all=false    指定容器暴露的端口  
  -p, --publish=[]           指定容器暴露的端口 
  -h, --hostname=""          指定容器的主机名  
  -v, --volume=[]            给容器挂载存储卷，挂载到容器的某个目录  
  --volumes-from=[]          给容器挂载其他容器上的卷，挂载到容器的某个目录
  --cap-add=[]               添加权限，权限清单详见：http://linux.die.net/man/7/capabilities  
  --cap-drop=[]              删除权限，权限清单详见：http://linux.die.net/man/7/capabilities  
  --cidfile=""               运行容器后，在指定文件中写入容器PID值，一种典型的监控系统用法  
  --cpuset=""                设置容器可以使用哪些CPU，此参数可以用来容器独占CPU  
  --device=[]                添加主机设备给容器，相当于设备直通  
  --dns=[]                   指定容器的dns服务器  
  --dns-search=[]            指定容器的dns搜索域名，写入到容器的/etc/resolv.conf文件  
  --entrypoint=""            覆盖image的入口点  
  --env-file=[]              指定环境变量文件，文件格式为每行一个环境变量  
  --expose=[]                指定容器暴露的端口，即修改镜像的暴露端口  
  --link=[]                  指定容器间的关联，使用其他容器的IP、env等信息  
  --lxc-conf=[]              指定容器的配置文件，只有在指定--exec-driver=lxc时使用  
  --name=""                  指定容器名字，后续可以通过名字进行容器管理，links特性需要使用名字  
  --net="bridge"             容器网络设置:
                                bridge 使用docker daemon指定的网桥     
                                host     //容器使用主机的网络  
                                container:NAME_or_ID  >//使用其他容器的网路，共享IP和PORT等网络资源  
                                none 容器使用自己的网络（类似--net=bridge），但是不进行配置 
  --privileged=false         指定容器是否为特权容器，特权容器拥有所有的capabilities  
  --restart="no"             指定容器停止后的重启策略:
                                no：容器退出时不重启  
                                on-failure：容器故障退出（返回值非零）时重启 
                                always：容器退出时总是重启  
  --rm=false                 指定容器停止后自动删除容器(不支持以docker run -d启动的容器)  
  --sig-proxy=true           设置由代理接受并处理信号，但是SIGCHLD、SIGSTOP和SIGKILL不能被代理
```

> 容器保持运行方式

> docker run -dit --hostname centos --name centos --restart always a8493f5f50ff /bin/bash

> docker run -dit --name dispatcherapi -p 8200:8200  dispatchercoreapi


##### 进入容器

>docker exec -it 镜像实例id bash

#### 退出容器
> exit  / (ctrl+P+Q)

```
1.重启容器
docker restart 容器ID

```


#####  查看 容器 ip 

```
1.进入容器 cat /etc/hosts
2.docker inspect 实例Id | grep IPAddress
3.可以考虑在 ~/.bashrc 中写一个 bash 函数

```

##### 查看容器日志
> docker logs -f -t -tail 行数 容器名



##### 查看停止的容器
查看所有停止容器
> docker ps -a | grep Exit

获取停止容器的ID
> docker ps -a|grep Exited|awk '{print $1}'

#删除所有未运行的容器（已经运行的删除不了，未运行的就一起被删除了）

> sudo docker rm $(sudo docker ps -a -q)

#####  docker 网络
在主机上创建一个网络
> docker network create mynet

查看自定义bridge网络
> docker network inspect mynet

移除网络要求网络中所有的容器关闭或断开与此网络的连接时，才能够使用移除命令
> docker network disconnet mynet 容器ID

移除网络
> docker network rm mynet


---


### docker redis
> 安装Redis

> yum install redis

> 启动redis 容器

>docker run --name 5958914cc558 -p 6380:6379  -d redis --requirepass "123456"

这里也可以不设置密码

> 进入redis客户端

> docker exec -it 3e3620f56613  redis-cli



### docker 里面安装软件
> vim install
```
1.yum -y install wget
2.yum install -y vim
```


> 软件安装工具
```
yum  centos,redhat
apt-get Ubuntu

```