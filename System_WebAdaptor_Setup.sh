#!/bin/bash

# update OS
echo Update OS...
sudo yum update -y

# update installation tools
echo Update Installation Tools
sudo yum install nano -y
sudo yum install wget -y

# open ArcGIS Web Adaptor ports
echo Open Ports...
sudo firewall-cmd --add-port=80/tcp --zone=public --permanent
sudo firewall-cmd --add-port=8080/tcp --zone=public --permanent
sudo firewall-cmd --reload

# mount CD-ROM
echo Mount CD-ROM...
sudo mkdir /mnt/cdrom
sudo mount /dev/sr0 /mnt/cdrom