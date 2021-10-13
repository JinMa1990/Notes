## 下载



```shell
# 下载
wget https://ftp.gnu.org/gnu/gdb/gdb-11.1.tar.xz
# 解压
xz -d gdb-11.1.tar
tar -xvf gdb-11.1.tar
cd cd gdb-11.1
mkdir build
cd build
../configure --target=arm-linux-gnueabihf --prefix=/home/majin/tool/gdb
make
make install

```

