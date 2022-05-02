#!/bin/bash

# unpack 
echo Unpack Installation Media...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/ArcGIS_Web_Adaptor_Java_Linux_109_177888.tar.gz -C /home/cfarris/install

# install ArcGIS WebAdaptorc
sh /home/cfarris/install/WebAdaptor/Setup -m silent -l Yes
sudo cp /home/cfarris/arcgis/webadaptor10.9/java/arcgis.war /opt/tomcat/webapps/