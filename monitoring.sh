#!/bin/bash

#Architecture
archi=$(uname -a)

#CPU physical
cpuf=$(grep "physical id" /proc/cpuinfo | wc -l)

#CPU virtual
cpuv=$(grep "processor" /proc/cpuinfo | wc -l)

#Memory usage
mem_use=$(free --mega | awk '$1 == "Mem:" {print $3}')
mem_total=$(free --mega | awk '$1 == "Mem:" {print $2}')
mem_per=$(free --mega | awk '$1 == "Mem:" {printf("%.2f", $3/$2*100)}')

#Disk Usage
disk_use=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_u += $3} END {print disk_u}')
disk_total=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_t += $2} END {printf ("%.1f", disk_t/1024)}')
disk_per=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_u += $3} {disk_t+= $2} END {printf("%d", disk_u/disk_t*100)}')

#CPU load
cpu_load=$(vmstat | tail -1 | awk '{printf("%.1f", 100-$15)}')

#Last boot
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')

#LVM use
lvmu=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no;fi)

#Connection TCP
tcpc=$(ss -ta | grep ESTAB | wc -l)

#User log
user_log=$(users | wc -w)

#Network
ip=$(hostname -I)
mac=$(ip link | grep "link/ether" | awk '{print $2}')
#Sudo
cmnd=$(journalctl -q | grep COMMAND | wc -l)

wall "
	#Architecture: $archi
	#CPU physical: $cpuf
	#vCPU: $cpuv
	#Memory Usage: $mem_use/${mem_total}MB ($mem_per%)
	#Disk Usage: $disk_use/${disk_total}GB ($disk_per%)
	#CPU load: $cpu_load%
	#Last boot: $lb
	#LVM use: $vmm
	#Connection TCP: $tcpc ESTABLISHED
	#User log: $user_log
	#Network: IP $ip ($mac)
	#Sudo: $cmnd cmd
"