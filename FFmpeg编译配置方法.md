**源码下载地址：[https://github.com/FFmpeg/FFmpeg/releases](https://github.com/FFmpeg/FFmpeg/releases)**
# 在ubuntu16.04上的编译x86库
 1. 编译ffmpeg

（1）       在编译前，需要在系统中下载ffmpeg源码（建议使用ffmpeg 4.1及以上版本）。

（2）       下载后，放到程序待运行的linux主机上，解压：

                                     tar zxvf FFmpeg-n4.1.3.tar.gz

（3）       进入FFmpeg-n4.1.3目录，执行configure：

                                    ./configure --enable-shared --prefix="<where you place> " --disable-swresample
    
                                    注：<where you place> 为ffmpeg安装路径(下同), 如：/usr/local/ffmpeg，则命令为：
    
                                     ./configure --enable-shared --prefix="/usr/local/ffmpeg" --disable-swresample

（4）       执行编译命令: make。

（5）       执行安装ffmpeg的命令：sudo make install.

（6）       没有提示“fail”，则安装成功。

# 在ubuntu16.04上的编译ARM库
1.       准备交叉编译环境

（1）       请准备一台x86_64服务器，将我们提供的Atlas500_package.zip多次解压，获取Euler_compile_env_cross文件夹。

              Euler_compile_env_cross就是我们提供的在x86_64服务器使用的交叉编译工具，方便编译Atlas 500上的程序。

（2）       修改/etc/profile，设置环境变量，添加至文件最后

                                    export PATH=$PATH:<where you place>/Euler_compile_env_cross/arm/cross_compile/install/bin

（3）       应用生效

                                   source /etc/profile

（4）       查看交叉编译工具aarch64-linux-gnu-g++版本，验证是否生效

                                  aarch64-linux-gnu-g++ -v
    
    2. 编译ffmpeg

（1）       在编译前，需要下载安装ffmpeg源码（建议使用ffmpeg 4.1及以上版本）到x86_64服务器。

（2）       下载后，放到程序待运行的linux主机上，解压：

                                tar zxvf FFmpeg-n4.1.3.tar.gz

（3）       进入FFmpeg-n4.1.3目录，执行configure：

        ./configure \
    
        --prefix=<where you place> \
    
        --target-os=linux \
    
        --arch=aarch64 \
    
        --enable-cross-compile \
    
        --cross-prefix=<your aarch64-linux-gnu path>/aarch64-linux-gnu- \
    
        --enable-shared \
    
        --disable-doc

 注：

        <where you place> 为ffmpeg安装路径(下同), 如：/opt/aarch64/ffmpeg 
    
          <your aarch64-linux-gnu path> 为x86_64服务器aarch64-linux-gnu放置位置，
    
    如：/home/Atlas500_DDK/toolchains/aarch64-linux-gcc6.3/bin


                                  如果需要链接x264，请先交叉编译x264(方法请参考附录)，再在configure的时候添加以下内容


​                                

                                --enable-libx264 --extra-cflags=-I<your x264 install path>/include  --
    
                                extra-ldflags=-L<your x264 install path>/lib --enable-gpl
    
                               <your x264 install path>为x26安装路径。


​         

（4）       执行编译命令: make。

（5）       执行安装ffmpeg的命令：sudo make install.

（6）       没有提示“fail”，则安装成功。