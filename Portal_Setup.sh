#!/bin/bash

# unpack 
echo Upack ArcGIS Server Installation...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/Portal_for_ArcGIS_Linux_1081_175300.tar.gz -C /home/cfarris/install

# install ArcGIS Server
echo Run ArcGIS Server Setup...
sh /home/cfarris/install/PortalForArcGIS/Setup -m silent -l Yes