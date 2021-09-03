#运行环境
ubuntu 18.04
mysql 5.7

# 卸载
sudo apt-get autoremove --purge mysql-server-5.7
sudo apt-get remove mysql-server        
sudo apt-get autoremove mysql-server 
sudo apt-get remove mysql-common
sudo rm -rf /etc/mysql/ /var/lib/mysql #很重要

#清理残留数据
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P 
sudo apt autoremove
sudo apt autoclean

# 安装

apt-get install mysql-server
apt-get install mysql-client
apt-get install libmysqlclient-dev

# 使用

## 启动服务

sudo /etc/init.d/mysql start

## 登录

##查看可以登录的用户名密码

sudo cat /etc/mysql/debian.cnf

##记住里面的user和password对应的值，然后进行登录

mysql -u debian-sys-maint -p
输入密码：......
use mysql;
select user, plugin from user;

如果root的plugin字段是’auth_socket‘ 修改语句：

update user set plugin='mysql_native_password' where user='root';

## 修改密码

update user set authentication_string=password('123456') where user='root';

刷新mysql权限

flush privileges; 

## 新密码登录

 mysql -u root -p

## 开启远程权限

mysql>GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;

mysql> FLUSH PRIVILEGES;

修改mysql配置文件

(1) vim /etc/mysql/mysql.conf.d/mysqld.cnf

(2)将bind-address = 127.0.0.1修改为bind-address = 0.0.0.0

(3)保存退出esc :wq

(4)/etc/init.d/mysql restart (一定要重启数据库,不然没用)

## 可视化界面安装（workbench）

sudo apt-get install mysql-workbench

命令行输入mysql-workbench就可以启动

