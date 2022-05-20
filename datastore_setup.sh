#!/bin/bash

# open ArcGIS DataStore ports
echo Opening Ports...
sudo firewall-cmd --add-port=2443/tcp --zone=public --permanent
# reload firewall
sudo firewall-cmd --reload

# unpack 
echo Upack ArcGIS Server Installation...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/ArcGIS_DataStore_Linux_109_177887.tar.gz -C /home/cfarris/install

# install ArcGIS Server
echo Run ArcGIS Server Setup...
sh /home/cfarris/install/ArcGISDataStore_Linux/Setup -m silent -l Yes