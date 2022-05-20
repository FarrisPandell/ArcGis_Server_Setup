#!/bin/bash

# open ArcGIS Web Adaptor ports
echo Opening Ports...
# sudo firewall-cmd --add-port=80/tcp --zone=public --permanent
# sudo firewall-cmd --add-port=443/tcp --zone=public --permanent
# reload firewall
sudo firewall-cmd --reload

# unpack 
echo Unpack Installation Media...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/ArcGIS_Web_Adaptor_Java_Linux_109_177888.tar.gz -C /home/cfarris/install

# install ArcGIS WebAdaptorc
sh /home/cfarris/install/WebAdaptor/Setup -m silent -l Yes
sudo cp /home/cfarris/arcgis/webadaptor10.9/java/arcgis.war /home/cfarris/tomcat9/webapps/