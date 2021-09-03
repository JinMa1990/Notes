看了许多文章都没成功，这篇成功了
参考：https://www.linuxidc.com/Linux/2017-09/147112.htm


两种方法（亲测可用）

#xubuntu-desktop （桌面变为xubuntu的）
 1  #安装xrdp 
 2  sudo apt-get install xrdp 
 3  #安装vnc4server 
 4  sudo apt-get install vnc4server tightvncserver
 5  #安装xubuntu-desktop 
 6  sudo apt-get install xubuntu-desktop 
 7  #向xsession中写入xfce4-session 
 8  echo “xfce4-session” >~/.xsession 
 9  #开启xrdp服务 
10  sudo service xrdp restart


#ubuntu原生桌面（稍有卡顿，不影响使用）

##安装xrdp
sudo apt-get install xrdp -y

#配置xrdp设置
需要通过xrdp连接到桌面，需要正确配置相关信息并填充到.xsession文件（针对每个用户）或/etc/startwm.sh（针对所有用户），输入如下命令
echo unity>~/.xsession

或者

sudo sed -i.bak '/fi/a #xrdp multi-users \n unity \n' /etc/xrdp/startwm.sh

#重启xrdp 
sudo service xrdp restart

#开启桌面共享
进入系统-》首选项-》桌面共享，或者直接搜索桌面共享，如图所示
![image.png](https://upload-images.jianshu.io/upload_images/5806964-e979c59242b2b08f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
将【允许其他人查看您的桌面】这一项勾上吗，如图所示：
![image.png](https://upload-images.jianshu.io/upload_images/5806964-2a8bab343093972f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#开始使用

启动Windows远程桌面工具(mstc)，输入Ubuntu的IP地址，如图所示

![image.png](https://upload-images.jianshu.io/upload_images/5806964-35133dc4a90b1661.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/5806964-5c4c82bb782754c9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/5806964-581500ec25815785.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
至此，xrdp连接Ubuntu 16.04的所有步骤已完成。
















