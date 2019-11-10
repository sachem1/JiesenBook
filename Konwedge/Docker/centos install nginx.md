### 部署Nginx

> 1.安装依赖
```
　1 SSL功能需要openssl库，直接通过yum安装: yum install openssl

　2 gzip模块需要zlib库，直接通过yum安装: yum install zlib

　3 rewrite模块需要pcre库，直接通过yum安装: yum install pcre

```
> 2.使用yum安装nginx需要包括Nginx的库，安装Nginx的库

> rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

> 3.安装nginx

> yum install nginx

> 4.开机启动并启动Nginx
```
1.systemcel enable nginx.service
2.service nginx start

```

### docker install
1. docker pull nginx 


### 常见操作

1. 查看Nginx 运行及目录
> ps -ef | grep nginx 

2.验证配置是否正确:
> nginx -t

3.查看Nginx的版本号
> nginx -V

4.启动Nginx
> start nginx 或 systemctl start nginx

5.快速停止或关闭Nginx
> nginx -s stop

6.正常停止或关闭Nginx
> nginx -s quit

7.配置文件修改重装载命令
> nginx -s reload

8.查看nginx 配置文件是否正确
> nginx -t

 
 9.查看nginx 安装目录
 > find /|grep nginx.conf
 
 
 
 
 ### nginx 配置调整
 > 1.修改运行cpu 保证以计算机的型号运行  
 
 > 2.配置nginx 集群
 ```
upstream dynamic {
        server 172.16.2.108:8001;
        server 172.16.2.109:8008;
        server 172.16.2.110:8009;
}

server {
    listen       8000;
    server_name  localhost;
    #root /opt/sites/Caad.Dispatcher.CoreUI;
    #index index.html;
    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location /{
        proxy_pass http://dynamic;
        proxy_http_version 1.1;
        proxy_next_upstream     error timeout invalid_header http_500 http_404 http_403;
        proxy_connect_timeout   2;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

 
 
 ```
 
 
 
 ###  Nginx 一般配置
 ```
 server {
    listen       80;
    server_name  localhost;
    root /home/website/undocker/Caad.Dispatcher.CoreUI-Release;
    index index.html;
    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location /{
       #proxy_pass http://localhost:8100;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        }
}

 
 
 ```
 
 ### 常见问题
 > 提示pid 找不到
 
 执行 nginx -c /etc/nginx/nginx.conf
 
 > 只是显示nginx 默认页面  
 
 看看是否是端口被占用了,修改监听端口