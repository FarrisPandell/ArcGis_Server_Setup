#!/bin/bash

# update OS
yum update -y
yum upgrade -y

# update install tools
yum install nano -y
yum install net-tools -y

# open ArcGIS Server ports
sudo firewall-cmd --add-port=4003/tcp --zone=public --permanent
sudo firewall-cmd --add-port=4004/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6006/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6080/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6099/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6443/tcp --zone=public --permanent
firewall-cmd --reload

# increase limits
ulimit -u 65535
ulimit -n 65535

# mount CD-ROM
mkdir /mnt/cdrom
mount /dev/sr0 /mnt/cdrom

# unpack 
mkdir /home/cfarris/install
tar -xf /mnt/cdrom/ArcGIS_Server_Linux_1061_164044.tar.gz -C /home/cfarris/install

# install ArcGIS Server
sh /home/cfarris/install/Setup -m silent -l Yes -a /mnt/cdrom/ArcGISGISServerAdvanced_ArcGISServer_1153083.prvc