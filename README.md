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





