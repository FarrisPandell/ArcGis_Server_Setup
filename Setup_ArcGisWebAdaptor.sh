#!/bin/bash

# update OS
yum update -y
yum upgrade -y

# update install tools
yum install nano -y
yum install net-tools -y

# open ports
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload

# install Tomcat
yum install tomcat tomcat-webapps tomcat-admin-webapps tomcat-docs-webapp tomcat-javadoc -y

# start Tomcat
systemctl stop httpd
systemctl start tomcat
systemctl enable tomcat

# mount CD-ROM
mkdir /mnt/cdrom
mount /dev/sr0 /mnt/cdrom

# unpack 
mkdir /home/cfarris/install
tar -xf /mnt/cdrom/Web_Adaptor_Java_Linux_1061_164057.tar.gz -C /home/cfarris/install

# install ArcGIS WebAdaptor
sh /home/cfarris/install/Setup -m silent -l Yes
cp /home/cfarris/arcgis/webadaptor10.6.1/java/arcgis.war /usr/share/tomcat/webapps/