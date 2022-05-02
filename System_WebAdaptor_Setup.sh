#!/bin/bash

# update OS
echo Update OS...
sudo yum update -y
sudo yum upgrade -y

# update installation tools
echo Update Installation Tools
sudo yum install nano -y
sudo yum install net-tools -y

# open ArcGIS Web Adaptor ports
echo Open Ports...
sudo firewall-cmd --add-port=80/tcp --zone=public --permanent
sudo firewall-cmd --add-port=8080/tcp --zone=public --permanent
sudo firewall-cmd --reload

# install Tomcat
echo Install Tomcat...
sudo yum install tomcat tomcat-webapps tomcat-admin-webapps tomcat-docs-webapp tomcat-javadoc -y

# start Tomcat
echo Start Tomcat...
sudo systemctl stop httpd
sudo systemctl start tomcat
sudo systemctl enable tomcat

# mount CD-ROM
echo Mount CD-ROM...
sudo mkdir /mnt/cdrom
sudo mount /dev/sr0 /mnt/cdrom