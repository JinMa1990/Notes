<<<<<<< HEAD
# 学习资料

## 官方提供的资料

[资料](http://www.live555.com/liveMedia/public/)

## 官方文档

[文档](http://www.live555.com/liveMedia/doxygen/html/classMedium.html)

## 源码编译

+ 将卸载的源码放到Linux换将下，解压源码包



```
tar -zxvf live.2020.05.15.tar.gz
```



+ 得到live文件夹加，进入live目录下

```
cd live/
```

+ 生成makefile

```
./genMakefiles linux
```



+ 编译

```
make
```



## RTSP 推流

+ FFmpeg MP4转h264

```shell
//input.mp4是指要转换视频的地址；output.mp4是转化后视频的存放路径
ffmpeg -i input.mp4 -vcodec h264 output.mp4  
ffmpeg -i input.mp4 -vcodec mpeg4 output.mp4
```

+ 编译后在live/mediaServer下生成live555MediaServer，拷贝一个.264测试视频文件到/live/mediaServer下

+ 开启LIVE555服务器

```shell
./live555MediaServer
```



## Windows 下打开VLC播放

=======
# 学习资料

## 官方提供的资料

[资料](http://www.live555.com/liveMedia/public/)

## 官方文档

[文档](http://www.live555.com/liveMedia/doxygen/html/classMedium.html)

## 源码编译

+ 将卸载的源码放到Linux换将下，解压源码包



```
tar -zxvf live.2020.05.15.tar.gz
```



+ 得到live文件夹加，进入live目录下

```
cd live/
```

+ 生成makefile

```
./genMakefiles linux
```



+ 编译

```
make
```



## RTSP 推流

+ FFmpeg MP4转h264

```shell
//input.mp4是指要转换视频的地址；output.mp4是转化后视频的存放路径
ffmpeg -i input.mp4 -vcodec h264 output.mp4  
ffmpeg -i input.mp4 -vcodec mpeg4 output.mp4
```

+ 编译后在live/mediaServer下生成live555MediaServer，拷贝一个.264测试视频文件到/live/mediaServer下

+ 开启LIVE555服务器

```shell
./live555MediaServer
```



## Windows 下打开VLC播放

>>>>>>> c2afa9ee1050ad05ca364fccf01b20307a225cc6
打开VLC播放器，媒体->打开网络串流，输入rtsp://ip:8554/文件名.264