#!/bin/bash -ex

raspbian_zip="2012-12-16-wheezy-raspbian.zip"
raspbian_img="2012-12-16-wheezy-raspbian.img"
raspbian_url="http://files.velocix.com/c1410/images/raspbian/2012-12-16-wheezy-raspbian/2012-12-16-wheezy-raspbian.zip"
target="/home/rik/Desktop/Raspberry_Pi"
kernel_url="http://xecdesign.com/downloads/linux-qemu/kernel-qemu"
swapsize="1G"
#create target
create_target()
{
[[ -d $target ]] || mkdir -p $target
}

create_swap ()
{
	qemu-img create -f raw $target/swap $swapsize
}

#install function
install ()
{
	apt-get update
	DEBIAN_FRONTEND=noninteractive apt-get -y \
        -o DPkg::Options::=--force-confdef \
        -o DPkg::Options::=--force-confold \
        install $@
}

usage ()
{
	echo "help goes here"
	echo 1
}

commit ()
{
	#check privs
	privs
	create_target
	#install packages
	install qemu qemu-system
	#d/l image
	cd $target && wget $raspbian_url
	#unzip image
	cd $target && unzip $raspbian_zip
	#d/l kernel
	wget -O $target/kernel-qemu http://xecdesign.com/downloads/linux-qemu/kernel-qemu
	create_swap
}

#Check for Root
privs ()
{
	if [ "$(id -u)" != 0 ]; then
		echo "Sorry, $0 must be run as root with the $1 argument."
		exit 1
	fi	
}

do_it ()
{
	cd $target && qemu-system-arm -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1" -hda $raspbian_img -hdb swap
}

if [[ $# == 1 ]]; then
	if [[ $1 == "install" ]]; then
		commit
	else
		usage
	fi
else
	do_it
fi


