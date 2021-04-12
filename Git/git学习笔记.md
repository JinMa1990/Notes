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

> 你可以提出更改（把它们添加到暂存区），使用如下命令：
>
> git add <filename>
>
> git add *



> 这是 git 基本工作流程的第一步；使用如下命令以实际提交改动：
>
> git commit -m "代码提交信息"



现在，你的改动已经提交到了 **HEAD**，但是还没到你的远端仓库





# 推送改动

你的改动现在已经在本地仓库的 **HEAD** 中了。执行如下命令以将这些改动提交到远端仓库：

> git push origin master         # 可以把 *master* 换成你想要推送的任何分支。

如果你还没有克隆现有的仓库，并欲将你的仓库连接到某个远程服务器，你可以使用日系命令添加：

> git remote add origin  <server>





# 提交代码到Gitee



# git branch 用法总结

> 参考：https://blog.csdn.net/u013091013/article/details/77701003
>
> 

[Git](http://lib.csdn.net/base/git) branch
  
  [git](http://lib.csdn.net/base/git) branch 不带参数：列出本地已经存在的分支，并且在当前分支的前面加“*”号标记，例如：
  \#git branch
\* master
  newbranch

  git branch -r 列出远程分支，例如：
  \#git branch -r
  m/master -> origin_apps/m1_2.3.4
  origin_apps/hardware/test
  origin_apps/m1
  origin_apps/m1_2.3.4
  origin_apps/master

  git branch -a 列出本地分支和远程分支，例如：
  \#git branch -a
  \* master
  newbranch
  remotes/m/master -> origin_apps/m1_2.3.4
  remotes/origin_apps/hardware/test
  remotes/origin_apps/m1
  remotes/origin_apps/m1_2.3.4
  remotes/origin_apps/master

  git branch 创建一个新的本地分支，需要注意，此处只是创建分支，不进行分支切换，例如：
  \#git branch newbranch2
  \#git branch
  \* master
  newbranch
  newbranch2
  当前的分支依然是master，不进行切换。

  git branch -m | -M oldbranch newbranch 重命名分支，如果newbranch名字分支已经存在，则需要使用-M强制重命名，否则，使用-m进行重命名。

  git branch -d | -D branchname 删除branchname分支

  git branch -d -r branchname 删除远程branchname分支


例子：
git help branch中的一个例子：
  $ git clone git://git.kernel.org/pub/scm/.../[Linux](http://lib.csdn.net/base/linux)-2.6 my2.6
  $ cd my2.6
  $ git branch my2.6.14 v2.6.14  
  $ git checkout my2.6.14    

  第三行符合git branch <branchname> [<start-point>]的格式，即以v2.6.14为start-point，创建新的本地分支branchname。