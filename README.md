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