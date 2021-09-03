# atlas500 ddk安装 

cd /home
unzip unzip Atlas500-ESP-1.3.5.B896.zip

cd Atlas500-ESP/

mkdir -p /home/Atlas500_DDK

tar -zxvf IES_DDK_B011.tar.gz -C /home/Atlas500_DDK/

sudo tar -zxvf Euler_compile_env_cross.tar.gz -C /home/Atlas500_DDK/toolchains

cd /home/Atlas500_DDK

cat ddk_info 

vim ~/.bashrc
'
export DDK_HOME=/home/Atlas500_DDK
export PATH=$PATH:$DDK_HOME/host/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH$DDK_HOME/host/lib
'

source ~/.bashrc

cd /home/Atlas500_DDK/lib64
sudo ln -s libssl.so.1.1 libssl.so
sudo ln -s libcrypto.so.1.1 libcrypto.so
sudo ln -s libprotobuf.so.15 libprotobuf.so