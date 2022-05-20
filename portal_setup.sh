#!/bin/bash

# open ArcGIS Portal ports
echo Opening Ports...
sudo firewall-cmd --add-port=7080/tcp --zone=public --permanent
sudo firewall-cmd --add-port=7443/tcp --zone=public --permanent
sudo firewall-cmd --add-port=7005/tcp --zone=public --permanent
sudo firewall-cmd --add-port=7099/tcp --zone=public --permanent
sudo firewall-cmd --add-port=7654/tcp --zone=public --permanent
# reload firewall
sudo firewall-cmd --reload

# unpack 
echo Upack ArcGIS Server Installation...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/Portal_for_ArcGIS_Linux_109_177885.tar.gz -C /home/cfarris/install

# install ArcGIS Server
echo Run ArcGIS Server Setup...
sh /home/cfarris/install/PortalForArcGIS/Setup -m silent -l Yes