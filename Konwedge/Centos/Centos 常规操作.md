### 文件File
> 查看
```
tail 显示指定文件的后若干行。

tail -f filename
tail -n 20 filename
```
> 查看文件更改时间
```
1.stat 文件名
2.ls -l
```



删除文件(夹): 
```
1.rm -ir /home/test
-i是交互模式。使用这个选项，rm命令在删除任何文件前提示用户确认。
2.rm -rf 文件(夹)名

```
#### 其他
```
创建文件:  touch 文件名

查找 ps -ef |grep  文件名

复制 cp 源文件 目标文件

授权 chmod 777 -R*

移动 mv [options] 源文件或目录 目标文件或目录

删除文件
> rm 文件名

删除swp临时文件
> rm -rf dispatcher.conf.swp

```
> 创建文件夹 mkdir 文件夹名称 or mkdir -p 文件夹/文件夹

> 复制文件夹 cp -R scripts scripts1

> rm 文件夹
-r 表示递归
-rf 表示不提示用户删除目录下所有文件夹
-ir 表示删除的时候提示用户确认

> 查询历史命令
```
1.history
2.!行号   表示重复执行此行号命令
3.!!      表示执行上一次命令
4.!字符串 表示执行以此开头的命令

```
> vi 模式
```
1.G 表示跳转到文档底部
2.常见操作
    :w   保存文件但不退出vi
    :w file 将修改另外保存到file中，不退出vi
    :w!   强制保存，不推出vi
    :wq  保存文件并退出vi
    :wq! 强制保存文件，并退出vi
    q:  不保存文件，退出vi
    :q! 不保存文件，强制退出vi
    :e! 放弃所有修改，从上次保存文件开始再编辑
3.跳转指定行:编辑模式下 输入行号 回车
4.ctrl+g 表示显示当前光标,并显示总行
5.仅让当前用户显示行号,
输入命令：vim ~/.vimrc
写入：set nu
保存：wq
手动加载配置:source ~/.vimrc
6.


````

### 端口

检测端口是否通
```
1.telnet ip port    telnet 10.1.1.245 8100

2.lsof -i:8100

3.netstat -lnp|grep 8400

4.ps 10719 查看pid=10719 内容信息

```

### telnet 安装
```
1. yum install telnet
2. yum install telnet-server

```