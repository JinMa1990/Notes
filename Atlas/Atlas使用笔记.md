## 日志 

```
vi /etc/slog.conf

# Global log level
global_level=3

# User
user=HwHiAiUser

# Share memory size of node 512k * 32 biggest support
maxNodeSize=524272

# Share memory count of queue
maxQueueCount=40

# log-agent-host #
logAgentMaxFileNum=8
# set host one log file max size, range is (0, 104857600]
logAgentMaxFileSize=10485760
# set host log dir
logAgentFileDir=/var/dlog

#log server send log to IDE
#IP_address to bind: if you want to set ip_address manually, please open the item and add your ip.
#log_server_ip = 127.0.0.1

# Port: Please select a port number between 18000 and 18080([18000, 18080]).
daemon_socket_port=18080

#enable print event log, 0:disable, 1:enable
enableEvent=0

#zip switch, default : not zip
#0 : not zip

```



```
# 通过GLOBAL_LOG_LEVEL环境变量修改日志级别

export GLOBAL_LOG_LEVEL=1

```

## 登录

### root权限开通



```
vi /etc/ssh/sshd_config

PermitRootLogin yes
#DenyUser root
#DenyGroups root

systemctl restart sshd
```

### 登录超时设置

```
vi /etc/ssh/sshd_config
ClientAliveCountMax

vi /etc/profile

export TIMEMOUT=0

source /etc/profile

service sshd restart
```



参考：https://support.huawei.com/enterprise/zh/doc/EDOC1100133167/289d90b6

```
host

ssh admin@192.168.3.44  #Jsdl12#$
develop #sxd@SYS3


device
ifconfig endvnic 192.168.1.11 # 配置host侧ip
ssh HwHiAiUser@192.168.1.199 # 默认密码(Huawei2012#) 已修改为sxd@SYS3

  

```

## 在Atlas500小站上安装tcpdump和gdb

参考: https://bbs.huaweicloud.com/forum/thread-126320-1-1.html

## nfs

```shell
sudo apt-get install nfs-kernel-server #安装NFS服务器   
sudo apt-get install nfs-common #安装NFS客户端
 sudo apt-get install sysv-rc-conf
 sysv-rc-conf iptables off    #关闭防火墙
 
 sudo vi /etc/exports
 
在文件末尾添加： /home *(rw,sync,no_root_squash)

然后使用如下命令给你想要挂载的目录一个宽松的权限，我挂载的是/home/ubuntu/huawei/
    sudo chmod -R 777 /home/ubuntu/huawei/
    sudo chown -R nobody /home/ubuntu/huawei/
    然后使用如下命令开启nfs：
    sudo /etc/init.d/nfs-kernel-server start
    如果你修改了exports的内容，需要重启服务，使用:
    sudo /etc/init.d/nfs-kernel-server restart
    
    之后我们在Atlas500上，就可以挂载目录了：
    Euler:/ # mount -t nfs -o nolock 192.168.3.42:/home/majin/Atlas500/ /ubuntu
```