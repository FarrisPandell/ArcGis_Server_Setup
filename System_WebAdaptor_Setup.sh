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

# install Java
sudo yum install java-1.7.0-openjdk-devel

# create Tomcat user
sudo groupadd tomcat
sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

# install Tomcat
sudo yum install wget
cd ~
wget https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
sudo mkdir /opt/tomcat
sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

# update permissions
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/

# install systemd unit file
sudo cp /home/cfarris/ArcGIS_Setup/tomcat.service /etc/systemd/system/

# start Tomcat
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl status tomcat
sudo systemctl enable tomcat

# mount CD-ROM
echo Mount CD-ROM...
sudo mkdir /mnt/cdrom
sudo mount /dev/sr0 /mnt/cdrom