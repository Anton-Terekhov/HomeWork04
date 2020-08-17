#!/bin/bash

sudo su
echo "192.168.50.10:/var/nfs /mnt nfs rw,noatime,nosuid,proto=udp,vers=3 0 0" >> /etc/fstab
reboot now
