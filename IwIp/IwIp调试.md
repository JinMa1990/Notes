

```
#define LWIP_DEBUG
```



cc.h

```
#define LWIP_PLATFORM_DIAG(x)   do {print_log x;} while(0)
```



opt.h

```
#if !defined SOCKETS_DEBUG || defined __DOXYGEN__
#define SOCKETS_DEBUG                   LWIP_DBG_ON
#endif

```

