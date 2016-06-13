#!/bin/bash

/usr/sbin/rfkill unblock all

/usr/sbin/service NetworkManager start
/usr/sbin/service cups stop

iw dev wlan0 set power_save off
iw dev wlan1 set power_save off
iw dev wlan2 set power_save off

# Resume web browsers
killall -18 chromium
killall -18 chrome
killall -18 firefox

# Enable the watchdog again
echo '' > '/proc/sys/kernel/nmi_watchdog';

# Enable power saving throughout USB devices
echo 'on' > '/sys/bus/usb/devices/*/power/control';


# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series SoC Transaction Register
echo 'on' > '/sys/bus/pci/devices/0000:00:00.0/power/control';
# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series Graphics & Display
echo 'on' > '/sys/bus/pci/devices/0000:00:02.0/power/control';
# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series Trusted Execution Engine
echo 'on' > '/sys/bus/pci/devices/0000:00:1a.0/power/control';
# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series USB xHCI
echo 'on' > '/sys/bus/pci/devices/0000:00:14.0/power/control';
# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series Power Control Unit
echo 'on' > '/sys/bus/pci/devices/0000:00:1f.0/power/control'
