1. 安装mysql
```
docker run --name mysql -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root1230 mysql:8.0.12 \
--character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```
2. 进入mysql
```
docker ps|grep mysql #查看container_id
docker exec -it ${container_id} mysql -uroot -p
Enter password: 
```
3. 设置mysql
```
CREATE USER 'root'@'172.16.3.%' IDENTIFIED BY 'root1230';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.16.3.%';
```
4. Navicat12.1
```
由于新版本的MySQL8.0修改了默认的密码加密方式，旧版的Navicat连接报错，新的我发在群里
```
5. 字符集
```
character_set_client=utf8mb4 #客户端发来SQL的编码
character_set_connection=utf8mb4 #服务端用于解析客户端连接SQL的编码
character_set_results=utf8mb4 #服务端发送给客户端SQL结果的编码
```
6. 其它
```
MySQL中的utf8（utf8mb3)是只占3个字节的简版，实际上utf8mb4才是我们通常意义上的utf8，每个字符占用4个字节
```

7.性能优化
```
innodb_buffer_pool_size = 16G
innodb_log_buffer_size = 100M
innodb_log_file_size = 1G 
innodb_flush_method = O_DIRECT #避免双缓冲技术
max_allowed_packet = 16M #最大允许的数据包大小，16M，默认1024*1024*4
thread_cache_size = 12
innodb_autoextend_increment = 128M

sync_binlog = 0 #事务已提交，而无需同步到磁盘。
innodb_flush_log_at_trx_commit = 0 #0意味着刷新到磁盘，但不同步（在提交时不执行实际IO）

性能监控工具：zabbix监控MySQL（windows和linux环境）
> https://cloud.tencent.com/info/717250f6fa05582ccc9ca56eb19ad847.html
> https://github.com/itnihao/zabbix-book
```