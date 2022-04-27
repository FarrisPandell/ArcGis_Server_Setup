#!/bin/bash

# update OS
echo Update OS...
sudo yum update -y
sudo yum upgrade -y

# update install tools
echo Update Installation Tools
sudo yum install nano -y
sudo yum install net-tools -y

# open ports
echo Open Ports...
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
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