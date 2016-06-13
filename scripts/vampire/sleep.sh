#!/bin/bash

/usr/sbin/rfkill block all

/usr/sbin/service NetworkManager stop
/usr/sbin/service cups stop

iw dev wlan0 set power_save on
iw dev wlan1 set power_save on
iw dev wlan2 set power_save on

# Susend web browsers
killall -19 chromium
killall -19 chrome
killall -19 firefox

# Disable watchdog
echo '0' > '/proc/sys/kernel/nmi_watchdog';

# Slow down VM writeback
echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs';

# Enable power saving throughout USB devices
echo 'auto' > '/sys/bus/usb/devices/*/power/control';


# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series SoC Transaction Register
echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control';
# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series Graphics & Display
echo 'auto' > '/sys/bus/pci/devices/0000:00:02.0/power/control';
# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series Trusted Execution Engine
echo 'auto' > '/sys/bus/pci/devices/0000:00:1a.0/power/control';
# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series USB xHCI
echo 'auto' > '/sys/bus/pci/devices/0000:00:14.0/power/control';
# Runtime PM for PCI Device Intel Corporation Atom Processor Z36xxx/Z37xxx Series Power Control Unit
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.0/power/control'
