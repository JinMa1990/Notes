```c
static struct pbuf * low_level_input(struct netif *netif)
    
    
void HAL_ETH_RxCpltCallback(ETH_HandleTypeDef *heth)
{
 	osSemaphoreRelease(s_xSemaphore); # 释放信号量
}
```

```c
MX_LWIP_Init()
	tcpip_init( NULL, NULL );
	//配置gnetif
  	netif_add(&gnetif, &ipaddr, &netmask, &gw, NULL, &ethernetif_init, &tcpip_input);
    netif_set_default(&gnetif);
	netif_is_link_up(&gnetif);	//判断gnetif状态
		netif_set_up(&gnetif)
	    netif_set_down(&gnetif);
	//注册链接改变的回调 ethernetif_update_config
    netif_set_link_callback(&gnetif, ethernetif_update_config);
	//创建二值信号量Netif_LinkSemaphore 表示收到数据
    Netif_LinkSemaphore = osSemaphoreNew(1, 1, NULL);
	//配置链接参数
	link_arg.netif = &gnetif;
 	link_arg.semaphore = Netif_LinkSemaphore;
  	
	//创建 ethernetif_set_link 线程处理网络
    osThreadNew(ethernetif_set_link, &link_arg, &attributes);


```





```c
void ethernetif_set_link(void* argument)
		//读取PHY_BSR BSR是LAN8720状态寄存器速度，双工，连接状态等
	    HAL_ETH_ReadPHYRegister(&heth, PHY_BSR, &regvalue);
   		regvalue &= PHY_LINKED_STATUS; //获取连接状态0断开


```



## 创建TCP_Client

```
sys_thread_new("tcp_client", tcp_client_thread, NULL, DEFAULT_THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);

```

