#!/bin/bash

# open ArcGIS Web Adaptor ports
echo Opening Ports...
sudo firewall-cmd --add-port=80/tcp --zone=public --permanent
sudo firewall-cmd --add-port=443/tcp --zone=public --permanent
sudo firewall-cmd --add-port=8080/tcp --zone=public --permanent
sudo firewall-cmd --add-port=8443/tcp --zone=public --permanent
firewall-cmd --add-forward-port=port=443:proto=tcp:toport=8443
firewall-cmd --direct --add-rule ipv4 nat OUTPUT 0 -p tcp -o lo --dport 443 -j REDIRECT --to-ports 8443
# reload firewall
sudo firewall-cmd --reload

# unpack 
echo Unpack Installation Media...
sudo mkdir /home/cfarris/install
sudo tar -xf /mnt/cdrom/ArcGIS_Web_Adaptor_Java_Linux_109_177888.tar.gz -C /home/cfarris/install

# install ArcGIS WebAdaptorc
sh /home/cfarris/install/WebAdaptor/Setup -m silent -l Yes
sudo cp /home/cfarris/arcgis/webadaptor10.9/java/arcgis.war /home/cfarris/tomcat9/webapps/arcgis.war
sudo cp /home/cfarris/arcgis/webadaptor10.9/java/arcgis.war /home/cfarris/tomcat9/webapps/portal.war