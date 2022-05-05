#!/bin/bash

# unpack 
echo Upack ArcGIS Server Installation...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/ArcGIS_DataStore_Linux_1081_175312.tar.gz -C /home/cfarris/install

# install ArcGIS Server
echo Run ArcGIS Server Setup...
sh /home/cfarris/install/ArcGISDataStore_Linux/Setup -m silent -l Yes