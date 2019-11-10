## Git Shell
> **git [options] <command> [args]**
## GUI工具（乌龟）
> https://tortoisegit.org/ 提供各种语言包下载

## 简单介绍
1. 特点
- 指针的应用  
- 分支式
2. [分支模型](http://www.oschina.net/translate/a-successful-git-branching-model)

## Command

### 获取git帮助
> **git --help**  
> [官网文档](https://git-scm.com/docs)  
> [中文官网文档](https://git-scm.com/book/zh/v1/%E8%B5%B7%E6%AD%A5-%E5%85%B3%E4%BA%8E%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6)  
> [阮一峰Git](http://www.ruanyifeng.com/blog/2014/06/git_remote.html)

### 获取
1. git clone （从远程服务器把代码拉下来）
2. git fetch （同步远程服务器到本地库）
3. git pull （同步远程服务器到工作空间）

### 更新
1. git add . （将修改的代码添加git管理）
2. git commit -m （保存当前修改代码）
3. git commit -am == git add . && git commit -m '' （1&2的操作并集）
4. git rm -rf --cached . （删除本地git管理）
5. git merge （分支合并（本地和远程））
6. git push （将本地保存的git日志提交到远程）
7. git remote rm origin (删除原有分支)

### 查看
1. git diff （查看git中未保存的文件）
2. git status（查看工作空间中变更的文件状态《删除、添加、修改》）
3. git log （查看git日志）

## 分支&合并
1. git branch （创建分支、删除分支）
2. git checkout （切换分支）
3. git merge （分支合并）





### 生成github 密钥
```
1.在终端 输入命令ssh-keygen -t rsa -C "邮箱"
一直回车,不需要秘密
2.查看本地的ssh  cat ~/.ssh/id_rsa.pub
3.复制公钥到GitHub -- setting -ssh -> new ssh key

```