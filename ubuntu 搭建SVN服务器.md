## SVN安装

```
root@majin-All-Series:~# sudo apt-get -y install subversion
正在读取软件包列表... 完成
正在分析软件包的依赖关系树
正在读取状态信息... 完成
subversion 已经是最新版 (1.9.7-4ubuntu1)。
下列软件包是自动安装的并且现在不需要了：
  fonts-liberation2 fonts-opensymbol gir1.2-geocodeglib-1.0
  gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 gir1.2-gudev-1.0
  gir1.2-udisks-2.0 grilo-plugins-0.3-base gstreamer1.0-gtk3
  libboost-date-time1.65.1 libboost-filesystem1.65.1
  libboost-iostreams1.65.1 libboost-locale1.65.1 libcdr-0.1-1
  libclucene-contribs1v5 libclucene-core1v5 libcmis-0.5-5v5 libcolamd2
  libdazzle-1.0-0 libe-book-0.1-1 libedataserverui-1.2-2 libeot0
  libepubgen-0.1-1 libetonyek-0.1-1 libevent-2.1-6 libexiv2-14
  libfreerdp-client2-2 libfreerdp2-2 libgee-0.8-2 libgexiv2-2
  libgom-1.0-0 libgpgmepp6 libgpod-common libgpod4 liblangtag-common
  liblangtag1 liblirc-client0 liblua5.3-0 libmediaart-2.0-0
  libmspub-0.1-1 libodfgen-0.1-1 libqqwing2v5 libraw16 librevenge-0.0-0
  libsgutils2-2 libssh-4 libsuitesparseconfig5 libvncclient1 libwinpr2-2
  libxapian30 libxmlsec1 libxmlsec1-nss lp-solve media-player-info
  python3-mako python3-markupsafe syslinux syslinux-common
  syslinux-legacy usb-creator-common
使用'sudo apt autoremove'来卸载它(它们)。
升级了 0 个软件包，新安装了 0 个软件包，要卸载 0 个软件包，有 2 个软件包未                                                                                                                  被升级。
```

## 创建版本库
### 创建目录文件夹
```
majin@majin-All-Series:~$ sudo mkdir /home/svn
majin@majin-All-Series:~$ sudo mkdir /home/svn/project_common
majin@majin-All-Series:~$
```
### 创建svn版本库

```
majin@majin-All-Series:~$ sudo svnadmin create /home/svn/project_common/
majin@majin-All-Series:~$
```
## SVN 管理
为了便于管理，将所有版本库的密码和权限设置在同一个文件下面，操作步骤如下：

+ 取出~/project_common/conf/的authz和passwd两个文件到svn根目录下面
```
majin@majin-All-Series:/home/svn/project_common$ sudo cp ./conf/authz ../
[sudo] majin 的密码：
majin@majin-All-Series:/home/svn/project_common$ sudo cp ./conf/passwd ../
majin@majin-All-Series:/home/svn/project_common$
```
+ 修改每个版本库目录conf文件夹下面的svnserve.conf文件
```
majin@majin-All-Series:/home/svn$ sudo vim project_common/conf/svnserve.conf


### This file controls the configuration of the svnserve daemon, if you
### use it to allow access to this repository.  (If you only allow
### access through http: and/or file: URLs, then this file is
### irrelevant.)

### Visit http://subversion.apache.org/ for more information.

[general]
### The anon-access and auth-access options control access to the
### repository for unauthenticated (a.k.a. anonymous) users and
### authenticated users, respectively.
### Valid values are "write", "read", and "none".
### Setting the value to "none" prohibits both reading and writing;
### "read" allows read-only access, and "write" allows complete
### read/write access to the repository.
### The sample settings below are the defaults and specify that anonymous
### users have read-only access to the repository, while authenticated
### users have read and write access to the repository.
# anon-access = read
anon-access = none  ## 增加此行
# auth-access = write
anon-access = write   ## 增加此行
### The password-db option controls the location of the password
### database file.  Unless you specify a path starting with a /,
### the file's location is relative to the directory containing
### this configuration file.
### If SASL is enabled (see below), this file will NOT be used.
### Uncomment the line below to use the default password file.
# password-db = passwd
password-db = ../../passwd   ## 增加此行
### The authz-db option controls the location of the authorization
### rules for path-based access control.  Unless you specify a path
### starting with a /, the file's location is relative to the
### directory containing this file.  The specified path may be a
### repository relative URL (^/) or an absolute file:// URL to a text
### file in a Subversion repository.  If you don't specify an authz-db,
### no path-based access control is done.
### Uncomment the line below to use the default authorization file.
# authz-db = authz
authz-db = ../../authz   ## 增加此行
```
### 定义一下几个角色用来测试

    +  配置管理员（svnadmin），用来管理整个库
    +  项目经理（manage），用来相关管理文档
    +  开发人员 （dev），测试开发是否正常

### 创建方法 

打开svn目录下的passwd文件，创建方法是在[user]下面添加 username = passwd，记得“=”前后的空格，如下图：（svnadmin控制所有项目，统一管理）

```
majin@majin-All-Series:/home/svn$ sudo vim passwd

### This file is an example password file for svnserve.
### Its format is similar to that of svnserve.conf. As shown in the
### example below it contains one section labelled [users].
### The name and password for each user follow, one account per line.

[users]
# harry = harryssecret
# sally = sallyssecret
#
svnadmin = svnadmin
majin = majin
louwen = louwen
lqq = lqq
lcl = lcl
test1 = test1
dev = dev
pm = pm

```
## 启动svn服务

### 一次启动

```
 sudo svnserve -d -r /home/svn
```

### 开机自启动svn
+ 在/etc/init.d目录建立一个脚本文件svnd.sh
```
sudo vim /etc/init.d/svnd.sh

#! /bin/bash
# svn server startup
svnserve -d -r /home/svn

:wq

sudo chmod 777 svnd.sh
```
+ 更新修改权限：
```
majin@majin-All-Series:/etc/init.d$ update-rc.d svnd.sh defaults
==== AUTHENTICATING FOR org.freedesktop.systemd1.reload-daemon ===
重新载入 systemd 状态需要认证。
Authenticating as: majin,,, (majin)
Password:
==== AUTHENTICATION COMPLETE ===
majin@majin-All-Series:/etc/init.d$
```

## 访问

svn://ip/project_common

[参考] https://www.cnblogs.com/daxuezhidao/p/5716213.html