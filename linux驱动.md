## 字符设备驱动



### 字符设备驱动开发

```
/* 模块的加载与卸载 */
module_init(xxx_init);	//模块的加载			insmod (modprobe)命令加载时xxx_init函数就会被调用  mknod 创建设备节点
module_exit(xxx_exit);	//模块的卸载			rmmod (modprobe -r)命令卸载时xxx_exit函数就会被调用

static struct file_operations test_fops = { 
	.owner = THIS_MODULE,
	.open = chrtest_open,
	.read = chrtest_read,
	.write = chrtest_write,
	.release = chrtest_release,
};

/* 驱动 入口\出口 函数 */
static int __init xxx_init(void)
{
	retvalue = register_chrdev(200, "chrtest", &test_fops);			/* 注册字符设备驱动 */
}
static void __exit xxx_exit(void)
{
	unregister_chrdev(200, "chrtest");		/* 注销字符设备驱动 */
}
```



### 新字符设备驱动开发

```
/* 模块的加载与卸载 */
module_init(xxx_init);	//模块的加载			insmod (modprobe)命令加载时xxx_init函数就会被调用
module_exit(xxx_exit);	//模块的卸载			rmmod (modprobe -r)命令卸载时xxx_exit函数就会被调用

static struct file_operations test_fops = { 
	.owner = THIS_MODULE,
	.open = chrtest_open,
	.read = chrtest_read,
	.write = chrtest_write,
	.release = chrtest_release,
};

/* 驱动 入口\出口 函数 */
static int __init xxx_init(void)
{
//	int alloc_chrdev_region(dev_t *dev, unsigned baseminor, unsigned count, const char *name)
//	int register_chrdev_region(dev_t from, unsigned count, const char *name)
//	void cdev_init(struct cdev *cdev, const struct file_operations *fops)
//	int cdev_add(struct cdev *p, dev_t dev, unsigned count)
	
	/* 1, 注册字符设备驱动 */
    if(beep.major) { /* 给定主设备号 */
        beep.devid = MKDEV(beep.major, 0);
        ret = register_chrdev_region(beep.devid, BEEP_CNT, BEEP_NAME);
    } else {            /* 没给定设备号 */
        ret = alloc_chrdev_region(&beep.devid, 0, BEEP_CNT, BEEP_NAME);
        beep.major = MAJOR(beep.devid);
        beep.minor = MINOR(beep.devid);
    }
    
    /* 2,初始化cdev */
    beep.cdev.owner = THIS_MODULE;
    cdev_init(&beep.cdev, &beep_fops);
    
	/* 3,注册字符设备 */
	ret = cdev_add(&beep.cdev, beep.devid, BEEP_CNT);
	
	/* 4、创建类 */
    beep.class = class_create(THIS_MODULE, BEEP_NAME);
    if(IS_ERR(beep.class)) {
        ret = PTR_ERR(beep.class);
        goto fail_class;
    }
    
    /* 5,创建设备  */
    beep.device = device_create(beep.class, NULL, beep.devid, NULL, BEEP_NAME);
    if(IS_ERR(beep.device)) {
        ret = PTR_ERR(beep.device);
        goto fail_device;
    }
}
static void __exit xxx_exit(void)
{
	/* 1,删除字符设备 */
	cdev_del(&beep.cdev);
	
	/* 2,注销设备号 */
	unregister_chrdev_region(beep.devid, BEEP_CNT);
	
	/* 3,摧毁设备 */
	device_destroy(beep.class, beep.devid);
	
	/* 4,摧毁类 */
	class_destroy(beep.class);
}
```

