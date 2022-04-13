#!/bin/bash

# update OS
echo Update OS...
sudo yum update -y
sudo yum upgrade -y

# update installation tools
echo Update Installation Tools
sudo yum install nano -y
sudo yum install net-tools -y

# open ArcGIS Server ports
echo Open Ports...
sudo firewall-cmd --add-port=4003/tcp --zone=public --permanent
sudo firewall-cmd --add-port=4004/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6006/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6080/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6099/tcp --zone=public --permanent
sudo firewall-cmd --add-port=6443/tcp --zone=public --permanent
sudo firewall-cmd --reload

# mount CD-ROM
echo Mount CD-ROM...
sudo mkdir /mnt/cdrom
sudo mount /dev/sr0 /mnt/cdrom

# unpack 
echo Upack ArcGIS Server Installation...
sudo tar -xf /mnt/cdrom/ArcGIS_Server_Linux_1061_164044.tar.gz -C /home/cfarris

# install ArcGIS Server
echo Run ArcGIS Server Setup...
sudo sh /home/cfarris/ArcGISServer/Setup -m silent -l Yes -a /mnt/cdrom/ArcGISGISServerAdvanced_ArcGISServer_1153083.prvc