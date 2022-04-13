#!/bin/bash

# unpack 
echo Unpack Installation Media...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/Web_Adaptor_Java_Linux_1061_164057.tar.gz -C /home/cfarris/install

# install ArcGIS WebAdaptorc
sudo sh /home/cfarris/install/WebAdaptor/Setup -m silent -l Yes
sudo cp /home/cfarris/arcgis/webadaptor10.6.1/java/arcgis.war /usr/share/tomcat/webapps/