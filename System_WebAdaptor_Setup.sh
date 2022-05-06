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

# install Tomcat
cd /usr/local
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz
sudo tar -xvf apache-tomcat-9.0.62.tar.gz
sudo mv apache-tomcat-9.0.62 tomcat9

echo "export CATALINA_HOME="/usr/local/tomcat9"" >> ~/.bashrc
source ~/.bashrc
sudo sh /usr/local/tomcat9/bin startup.sh
