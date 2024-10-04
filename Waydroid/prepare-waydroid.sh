#!/bin/sh

modprobe usbmon
modprobe usbnet
modprobe cdc-wdm
insmod qmi_wwan_q.ko

chmod ugo+rwx /dev/bus/usb/001/004
chmod ugo+rwx /dev/cdc-wdm2
chmod ugo+rwx /dev/ttyUSB0
chmod ugo+rwx /dev/ttyUSB1
chmod ugo+rwx /dev/ttyUSB2
chmod ugo+rwx /dev/ttyUSB3
chmod ugo+rwx /sys/kernel/debug/usb/usbmon/1s
chmod ugo+rwx /sys/kernel/debug/usb/usbmon/1t
chmod ugo+rwx /sys/kernel/debug/usb/usbmon/1u

