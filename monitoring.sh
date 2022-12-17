#!/bin/bash

echo -ne "\t#Architecture: "
uname -a
echo -ne "\t#CPU physical: "
grep "physical id" /proc/cpuinfo | wc -l
echo -ne "\t#vCPU: "
grep “processor” /proc/cpuinfo | wc -l
echo -ne "\t#Memory Usage: "
free --mega | awk '$1 == "Mem:" {print $3}'
echo -ne "\t#Disk Usage: "

echo -ne "\t#CPU load: "
vmstat | tail -1 | awk '{printf(“%.1f”, 100-$15)}'
echo -ne "\t#Last boot: "
who -b | awk '{print $3 " " $4}'
echo -ne "\t#LVM use: "
if [ $(lsblk | grep "lvm" | wc -l ) -gt 0]
then
	echo yes
else
	echo no
fi
echo -ne "\t#Connection TCP: "

echo -ne "\t#User log: "

echo -ne "\t#Network: "

echo -ne "\t#Sudo: "

