#!/bin/sh

cp ${LICHEE_BR_OUT}/external-toolchain/arm-linux-gnueabi/libc/lib/arm-linux-gnueabi/* ${LICHEE_BR_OUT}/target/lib/ -pfr 
chmod +x ${LICHEE_BR_OUT}/target/lib/*
rm -rf ${LICHEE_BR_OUT}/target/init
(cd ${LICHEE_BR_OUT}/target && ln -s bin/busybox init)

cat > ${LICHEE_BR_OUT}/target/etc/init.d/rcS << EOF
#!/bin/sh

mount -t devtmpfs none /dev
mkdir /dev/pts
mount -t devpts none /dev/pts
mount -t sysfs sysfs /sys
hostname sinlinx
mkdir -p /boot
mount /dev/nanda /boot
MODULES_DIR=/lib/modules/\`uname -r\`

## mdev
echo /sbin/mdev > /proc/sys/kernel/hotplug
mdev -s


EOF

touch ${LICHEE_BR_OUT}/target/etc/init.d/auto_config_network

cat > ${LICHEE_BR_OUT}/target/etc/init.d/auto_config_network << EOF
#!/bin/sh

MAC_ADDR="\`uuidgen |awk -F- '{print \$5}'|sed 's/../&:/g'|sed 's/\(.\)$//' |cut -b3-17\`"

ifconfig eth0 hw ether "48\$MAC_ADDR"
ifconfig lo 127.0.0.1
udhcpc

EOF


chmod +x ${LICHEE_BR_OUT}/target/etc/init.d/rcS
chmod +x ${LICHEE_BR_OUT}/target/etc/init.d/auto_config_network
(cd target/skel/ && tar -c *) |tar -C ${LICHEE_BR_OUT}/target/ -xv


