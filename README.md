Tested On
-----
Ubuntu 12.04, 12.10

Configure
-----------
Configure by setting the values of variables at the head of raspi-qemu.sh

Install
-------
raspi-qemu.sh install

Run Raspbian via qemu
-----------
raspi-qemu.sh

Notes
-----------
Limited to 256 RAM. I've tried changing in the arguments to no effect. This script builds a swap image to use.

In raspbian:
`sudo mkswap /dev/sdb
sudo swapon /dev/sdb`
...to make use of swap.

What It Does
------------
When launched by raspi-qemu.sh install:
*creates /opt/Raspberry_Pi
*Downloads Raspbian from Raspberry Pi/Downloads to /opt/Raspberry_Pi
*Unzips Raspbian to /opt/Raspberry_Pi
*Downloads qemu-kernal to /opt/Raspberry_Pi

Use raspi-qemu to launch the Raspi Emulation.

Customize by editing variables at the top of raspi-qemu.sh
