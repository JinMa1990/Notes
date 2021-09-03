#默认路径
/lib
/usr/lib

一般 Linux 系统把 /lib 和 /usr/lib 两个目录作为默认的库搜索路径，所以使用这两个目录中的库时不需要进行设置搜索路径即可直接使用。

#设置自定义库路径
在 /etc/ld.so.conf 文件中添加库的搜索路径
例添加如下内容
sudo vi  /etc/ld.so.conf 

/usr/local/lib
/opt/lib

此时自定义的库路径已可用于链接，但是共享库不能加载执行，一下两种方法解决
##方法一 更新库到
每次路径里新增加库时 ld.so.cache
执行
ldconfig
把库更新到/etc/ld.so.cache 方可加载执行
##方法二 环境变量
建议使用shell脚本

\#！/bin/bash
export LD_LIBRARY_PATH=/opt/lib       
echo $LD_LIBRARY_PATH   
./xxx
（ /opt/lib 自定义的库路径）


#编译时指定库路径
待整理




