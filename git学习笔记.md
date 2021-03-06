<<<<<<< HEAD
[toc]

# 简介

+ Git 是一个开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目。

+ Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。
+ Git 与常用的版本控制工具 CVS, Subversion 等不同，它采用了分布式版本库的方式，不必服务器端软件支持。

# 创建新仓库

> git init

# 检出仓库

> git clone /path/to/repository
>
> git clone username@host:/path/to/repository

# 工作流

	+ 工作目录
	+ 暂存区
	+ HEAD



# 添加与提交



## 第一次提交

```
git config --global user.email "945058625@qq.com"	# 配置
git config --global user.name "JinMa1990"			# 配置
git init	#初始化仓库
git add README.md	#添加文件
git commit -m "first commit" # 添加提交注释
git branch -M main
git remote -v #查看远程仓库地址
git remote add origin https://github.com/JinMa1990/Notes.git
git push -u origin main
```

## 提交资料

```
#文件
git add README.md	#添加文件
git commit -m "说明" # 添加提交注释
git push -u origin main

# 目录
git add ./文件名
git status 
git commit -m "更改的信息"
git push 

# 删除
git rm .文件名
git status 
git commit -m "更改的信息"
git push 
```



# 分支管理

+ 常用命令

```
查看分支：   git branch -a
查看远程分支：git branch -r

创建分支：git branch <name>
切换分支：git checkout <name>
创建+切换分支：git checkout -b <name>
创建远程分支(本地分支push到远程)：$ git push origin [name]

删除分支: git branch -d <name>
删除远程分支：git push origin --delete <name>

合并某分支到当前分支：git merge <name>


提交代码到指定的分支
    git push origin xxx （xxx为要提交代码的分支名称）
拉取指定分支的代码
    git pull --rebase origin  xxx
    
 删除远程你所创建的分支
```



# 删除Git文件，保留磁盘文件

```
git rm –cached <filename>
git rm --cached -r <./path>
git commit -m "xxxx"
git push
```

# Git 标签
如果你达到一个重要的阶段，并希望永远记住那个特别的提交快照，你可以使用 git tag 给它打上标签。
-a 选项意为"创建一个带注解的标签"。 不用 -a 选项也可以执行的，但它不会记录这标签是啥时候打的，谁打的，也不会让你添加个标签的注解。 我推荐一直创建带注解的标签。

```
查看标签：
git tag -l

创建标签：
git tag -a v1.0

推送标签：
git push origin 标签名
git push origin refs/tags/源标签名:refs/tags/目的标签名

删除本地标签：
git tag -d 标签名

删除远程标签：
git push origin :refs/tags/标签名
git push origin :refs/tags/protobuf-2.5.0rc1
```
