

Atlas NFS

https://zhuanlan.zhihu.com/p/377700917

CC=aarch64-linux-gnu-gcc 

./configure --prefix=/opt/aarch64/zlib
  
# 编译x264 
git clone https://code.videolan.org/videolan/x264.git

./configure \
	--prefix=/opt/aarch64/x264 \
	--host=aarch64-linux \
	--cross-prefix=aarch64-linux-gnu- \
	--enable-shared \
	--enable-static \
	--disable-asm
make
make install

# 编译FFmpeg
export PATH=$PATH:/home/Atlas500_DDK/Euler_compile_env_cross/arm/cross_compile/install/bin
aarch64-linux-gnu-g++ -v

./configure \
	--prefix=/opt/aarch64/ffmpeg \
	--target-os=linux \
	--arch=aarch64 \
	--enable-cross-compile \
	--cross-prefix=/home/Atlas500_DDK/toolchains/aarch64-linux-gcc6.3/bin/aarch64-linux-gnu- \
	--enable-shared \
	--disable-doc \
	--enable-libx264 \
	--enable-gpl \
	--extra-cflags=-I/opt/aarch64/x264/include \
	--extra-ldflags=-L/opt/aarch64/x264/lib \
	--pkg-config="pkg-config --static"
	
./configure \
	--prefix=/opt/aarch64/ffmpeg \
	--target-os=linux \
	--arch=aarch64 \
	--enable-cross-compile \
	--cross-prefix=aarch64-linux-gnu- \
	--enable-shared \
	--disable-doc \
	--enable-libx264 \
	--extra-cflags=-I/opt/aarch64/x264/include \
	--extra-ldflags=-L/opt/aarch64/x264/lib \
	--enable-gpl 	
	
export FFMPEG_PATH=/opt/aarch64/ffmpeg

export FFMPEG_PATH=/opt/aarch64/ffmpeg/
export LD_LIBRARY_PATH=/opt/aarch64/ffmpeg/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/aarch64/x264/lib/:$LD_LIBRARY_PATH
export DDK_HOME=/home/Atlas500_DDK/


./configure \
 --host=arm-linux \
 CC=aarch64-linux-gnu-gcc  LDFLAGS=-static
 
 
mount -t nfs 192.168.3.42:/home/majin/Atlas500/ /ubuntu


mount -t smbfs -o codepage=cp936,username=majin,password=123456 , -l \\192.168.3.42\sambashare

 ./configure \
	--prefix=/opt/aarch64/ffmpeg \
	--target-os=linux \
	--arch=aarch64 \
	--enable-cross-compile \
	--cross-prefix=aarch64-linux-gnu- \
	--enable-shared \
	--disable-doc \
	--disable-libx264 \
设置日志级别
https://support.huaweicloud.com/logr-Inference-cann/atlaslog_24_0007.html

