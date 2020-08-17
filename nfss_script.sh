#!/bin/bash

sudo su
mkdir -p /var/nfs/upload
chown -R nfsnobody:nfsnobody /var/nfs
chmod 555 /var/nfs
echo "/var/nfs 192.168.50.11(rw,sync,root_squash,all_squash,no_subtree_check)" >> /etc/exports
systemctl start nfs-server
systemctl enable nfs-server
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --permanent --zone=public --add-service=nfs3
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
reboot now
