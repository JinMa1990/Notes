编译 Android 对机器的配置要求较高：

- 64 位 CPU
- 16GB 物理内存+交换内存
- 30GB 空闲的磁盘空间用于构建，源码树另外占用大约 25GB, 如果要编译源码则还需要 150GB 的磁盘空间

RK官方推荐 Ubuntu 14.04 操作系统，不过该系统比较老且不再维护了，所以这里推荐使用 Ubuntu 16.04或18.04，只需要满足 http://source.android.com/source/building.html 里的软硬件配置即可

## 编译准备工作

以下关于编译 Android 源代码树的说明适用于所有分支，包括 `master`。编译命令的基本顺序如下：