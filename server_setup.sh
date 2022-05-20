#!/bin/bash

# open ArcGIS Server, DataStore, Portal, and Web Adaptor ports
echo Opening Ports...
sudo firewall-cmd --add-port=4003/tcp --zone=public --permanent
sudo firewall-cmd --add-port=4004/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6006/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6080/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6099/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6443/tcp --zone=public --permanent
# reload firewall
sudo firewall-cmd --reload

# unpack 
echo Upack ArcGIS Server Installation...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/ArcGIS_Server_Linux_109_177864.tar.gz -C /home/cfarris/install

# install ArcGIS Server
echo Run ArcGIS Server Setup...
sh /home/cfarris/install/ArcGISServer/Setup -m silent -l Yes -a /mnt/cdrom/ArcGISGISServerAdvanced_ArcGISServer_1153083.prvc