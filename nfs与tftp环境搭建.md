# TFTP

```
sudo apt-get install xinetd
ls /etc/xinetd.conf
sudo vim /etc/xinetd.conf

# Simple configuration file for xinetd
#
# Some defaults, and include /etc/xinetd.d/

defaults
{

# Please note that you need a log_type line to be able to use log_on_success
# and log_on_failure. The default is the following :
# log_type = SYSLOG daemon info

}

includedir /etc/xinetd.d

mkdir -p /home/majin/tftp
sudo chmod 777 /home/majin/tftp

sudo apt-get install tftp-hpa tftpd-hpa

sudo vim /etc/default/tftpd-hpa
# /etc/default/tftpd-hpa

TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/home/majin/tftp"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="-l -c -s"


sudo vim /etc/xinetd.d/tftp

servicetftp 
	{ 
		socket_type = dgram 
		wait = yes 
		disable = no 
		user = root 
		protocol = udp 
		server = /usr/sbin/in.tftpd 
		server_args = -s /home/majin/tftp -c 
		#log_on_success += PID HOST DURATION 
		#log_on_failure += HOST 
		per_source = 11 
		cps =100 2 
		flags =IPv4 
	}
sudo service tftpd-hpa restart
sudo service xinetd restart
```



# NFS

```
sudo apt-get install nfs-kernel-server
sudo mkdir /home/majin/nfs 
sudo chmod 777 /home/majin/nfs/

sudo vim /etc/exports

/home/majin/nfs *(rw,sync,no_root_squash)

sudo /etc/init.d/nfs-kernel-server restart

showmount -e

```



