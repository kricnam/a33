#!/bin/sh

echo "[sinlinx] setup module"
#source /sinlinx/script_parser.sh

if [ ! -d /system/vendor/ ]; then
    mkdir -p /system/vendor/
    ln -s /lib/modules/`uname -r`/ /system/vendor/modules
    ln -s /boot/*.hcd /system/vendor/modules/
    ln -s /boot/*.bin /system/vendor/modules/
    ln -s /boot/*.txt /system/vendor/modules/
fi


# display
insmod /system/vendor/modules/disp.ko

# lcd
insmod /system/vendor/modules/lcd.ko

# wifi
cp /sinlinx/wlan/* /system/vendor/modules/
insmod /system/vendor/modules/bcmdhd.ko

#insmod /system/vendor/modules/hdmi.ko
#insmod /system/vendor/modules/8188eu.ko

# touch screen
insmod /system/vendor/modules/aw5306_ts.ko

insmod /system/vendor/modules/videobuf-core.ko
insmod /system/vendor/modules/videobuf-dma-contig.ko
insmod /system/vendor/modules/cam_detect.ko 
insmod /system/vendor/modules/actuator.ko
insmod /system/vendor/modules/ad5820_act.ko
insmod /system/vendor/modules/cci.ko
insmod /system/vendor/modules/vfe_os.ko
insmod /system/vendor/modules/vfe_subdev.ko
insmod /system/vendor/modules/ov5640.ko
insmod /system/vendor/modules/vfe_v4l2.ko
insmod /system/vendor/modules/rtl8152.ko


