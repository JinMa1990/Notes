
ssh admin@$1 <<EOF
sftp enable
develop
Huawei@SYS3

npu-smi info -l
npu-smi info -t board -i 0 -c 0
ifconfig

mkdir -p /mnt/mmc/p3
mkdir -p /mnt/mmc/p2
mount /dev/mmcblk0p2 /mnt/mmc/p2
mount /dev/mmcblk0p3 /mnt/mmc/p3


echo '[Unit]
Description=Station Application hook
#Documentation=https://docs.docker.com
After=platform-app.service
Wants=network-online.target

[Service]
Type=simple
#EnvironmentFile=-/etc/sysconfig/docker
#EnvironmentFile=-/etc/sysconfig/docker-storage
#EnvironmentFile=-/etc/sysconfig/docker-network
#Environment=GOTRACEBACK=crash
#ConditionFileIsExecutable=/usr/local/scripts/platform_init.sh
ExecStart=/opt/mount/storage/station/daemon.sh
TimeoutSec=6000
ExecReload=/bin/kill -s HUP $MAINPID
#LimitNOFILE=1048576
#LimitNPROC=1048576
#LimitCORE=infinity
# set delegate yes so that systemd does not reset the cgroups of docker containers
#Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=mixed
Restart=always
RestartSec=42s

[Install]
WantedBy=multi-user.target
' > /usr/lib/systemd/system/station.service


cp /usr/lib/systemd/system/station.service /mnt/mmc/p3/usr/lib/systemd/system/station.service
cp /usr/lib/systemd/system/station.service /mnt/mmc/p2/usr/lib/systemd/system/station.service

systemctl enable station.service
echo "set station.service ok!"

echo 'vm.panic_on_oom=1' >> /etc/sysctl.conf

cp  /etc/sysctl.conf  /mnt/mmc/p3/etc/sysctl.conf
cp  /etc/sysctl.conf  /mnt/mmc/p2/etc/sysctl.conf

sysctl -p
echo "setup sysctl ok!"

EOF

