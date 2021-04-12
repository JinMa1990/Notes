# Notes

# 添加公钥

## 生成公钥
```
ssh-keygen -C '945058625@qq.com' -t rsa
```
## 添加公钥
```
linux:
cd /home/majin/.ssh
cat cat id_rsa.pub
win10:
user/.ssh/id_rsa.pub
```

## 测试
```
ssh -T git@github.com
```


# 提交资料
```
git config --global user.email "945058625@qq.com"
git config --global user.name "JinMa1990"
git init	#初始化仓库
git add README.md	#添加文件
git commit -m "first commit" # 添加提交注释
git branch -M main
git remote add origin https://github.com/JinMa1990/Notes.git
git push -u origin main
```

# 分支管理 Branch

> 命令列表

```
查看分支：git branch
创建分支：git branch <name>
切换分支：git checkout <name>
创建+切换分支：git checkout -b <name>
合并某分支到当前分支：git merge <name>
删除分支: git branch -d <name>
```



# 更新代码测试

```
git add ./文件名
git status 
git commit -m "更改的信息"
git push 
```