```
#!/bin/bash

myip=`ifconfig enp3s0 |grep -w inet |awk '{print $2}'|awk -F':' '{print $2}'`
echo $myip