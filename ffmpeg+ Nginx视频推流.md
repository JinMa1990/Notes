## 软件下载

http://nginx-win.ecsds.eu/download/nginx 

> 下载1.7.11.3 Gryphon.zip 



## 参考

https://blog.csdn.net/ySh_lC/article/details/120841507

https://www.cnblogs.com/xxjs/p/12069364.html

https://blog.csdn.net/hanhui22/article/details/109842044

[ffmpeg移植]https://bd37e1e0.wiz06.com/wapp/pages/view/share/s/2Zd-7w3jBN7G22Uj5K2eelKh0PJa_F0Ll49n2w1nUJ2hiJC7



## 查看本地设备列表

```cmd
ffmpeg -list_devices true -f dshow -i dummy

ffmpeg -list_options true -f dshow -i video="HD USB Camera"  


```

## ffplay观看摄像头画面

```shell
# window
ffplay -f dshow -i video="HD USB Camera"
ffplay -f vfwcap -i 0

#linux
ffmpeg -f video4linux2 -s 800x480 -i /dev/video0 test.avi
```

##  ffmpeg推USB摄像头

```shell
# Window
ffmpeg -f dshow -i video="HD USB Camera" -vcodec libx264 -an -f flv rtmp://192.168.200.213:1935/live/home
# Linux 
ffmpeg -f video4linux2 -s 320x240 -i /dev/video2 -vcodec libx264 -an -f flv rtmp://192.168.200.213:1935/live/home

```

## ffmpeg 网络摄像头推流

```shell
# 实测网络摄像头消耗的资源会比较少
ffmpeg -i rtsp://admin:jsepc123@192.168.4.109/h264/ch1/main/av_stream -c copy -f flv rtmp://192.168.200.213:1935/live/home


ffmpeg -i rtsp://admin:sxd123!!@192.168.4.22/h264/ch1/main/av_stream -c copy -f flv rtmp://192.168.200.213:1935/live/home


```





## 将摄像头的视频保存到本地

```
 ffmpeg -f dshow -i video="HD USB Camera" -vcodec libx264 -an -c copy -f avi "D:\test1.avi"
 ffmpeg -draw_mouse 1 -offset_x 0 -offset_y 0 -f GDIgrab -i desktop -f flv rtmp://127.0.0.1:1935/live/123
```

