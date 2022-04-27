#!/bin/bash

# unpack 
echo Upack ArcGIS Server Installation...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/ArcGIS_Server_1061/Portal_for_ArcGIS_Linux_1061_164055.tar.gz -C /home/cfarris/install

# install ArcGIS Server
echo Run ArcGIS Server Setup...
sh /home/cfarris/install/ArcGISPortal_Linux/Setup -m silent -l Yes