## 安装

```
sudo apt-get install nfs-kernel-server

## 建立共享目录
```
sudo mkdir /home/majin/nfs 
sudo chmod 777 /home/majin/nfs/

## 配置NFS服务
```
sudo vim /etc/exports
```
在最后添加
/home/majin/nfs *(rw,sync,no_root_squash)
/home/majin/nfs表示NFS共享的目录
*表示允许所有的网络段访问
rw表示访问者具有可读写权限
sync表示将缓存写入设备中，可以说是同步缓存的意思
no_root_squash表示访问者具有root权限。

## 重启服务
```
sudo /etc/init.d/nfs-kernel-server restart
showmount -e    # 查看共享目录
```


## 挂载NFS
```
mkdir ubuntu
mount -t nfs -o nolock,nfsvers=3 192.168.3.42:/home/majin/nfs ubuntu/

## 卸载NFS目录
```
umount ubuntu

