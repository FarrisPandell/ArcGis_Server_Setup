#!/bin/bash

# unpack 
echo Upack ArcGIS Server Installation...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/ArcGIS_Server_Linux_1081_175289.tar.gz -C /home/cfarris/install

# install ArcGIS Server
echo Run ArcGIS Server Setup...
sh /home/cfarris/install/ArcGISServer/Setup -m silent -l Yes -a /mnt/cdrom/ArcGISGISServerAdvanced_ArcGISServer_1153083.prvc