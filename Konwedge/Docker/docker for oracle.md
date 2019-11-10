#### 安装Oracle
1.查看Oracle版本
> docker search oracle

2.下载Oracle
```
1.docker pull oraclelinux 这个版本需要自己安装环境
2.docker pull registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g 这个版本已经集成了
```
3.运行Oracle
> docker run -d -p 15211:1521 --name oracle_11g registry.aliyuncs.com/helowin/oracle_11g

服务名:helowin

4.进入Oracle
> 1.docker exec -it oracle_11g bash  

> 2.su root 切换到root 模式;  

> 3.密码:helowin  

> 3.1: source /home/oracle/.bash_profile 加载环境变量

> 4.修改oracle环境变量,profile文件配置
```
vi /etc/profile 并在文件最后添加如下命令

export ORACLE_HOME=/home/oracle/app/oracle/product/11.2.0/dbhome_2

export ORACLE_SID=helowin

export PATH=$ORACLE_HOME/bin:$PATH

保存配置
```
5.软件连接
> ln -s $ORACLE_HOME/bin/sqlplus /usr/bin

6.切换到Oracle用户
```
1.sqlplus /nolog

2.conn /as sysdba

3.alter user system identified by 密码;

4.alter user sys identified by 密码;

5.ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

```


7.创建用户
```
SQL> create user basf identified by basf;

User created.


SQL> grant create session to basf;

Grant succeeded.

SQL> grant sysdba to basf;

Grant succeeded.

SQL> grant create any table to basf;

Grant succeeded.

SQL> grant unlimited tablespace to basf;

Grant succeeded.


```

#### 常见操作
1.修改密码
> alter user system identified by oracle;  
alter user basf identified by basf;

2.授权
> grant create any table to basf; 

3.连接字符串
> DATA SOURCE=59.110.216.148:15211/helowin;PASSWORD=basf;PERSIST SECURITY INFO=True;USER ID=basf;

```
<add name="OracleConnString" connectionString="DATA SOURCE=192.168.7.207:1521/orcl;PASSWORD=basf;PERSIST SECURITY INFO=True;USER ID=basf;" providerName="Oracle.ManagedDataAccess.Client" />
```


#### 常见问题
1. 提示docker实例登陆没有权限
> 重启实例,没有问题