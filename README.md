# ArcGis_Server_Setup

sudo yum update -y
sudo yum install git -y
git clone https://github.com/FarrisPandell/ArcGis_Setup.git
cd /home/cfarris/ArcGIS_Setup
sudo sh System_Server_Setup.sh
sudo nano /etc/hosts 
- Add FQDN:  111.222.333.444 hostname.esri.com hostname

sudo nano /etc/security/limits.conf
- Add limits:
    account soft nofile 65536
    account hard nofile 65536
    account soft nproc 65536
    account hard nproc 65536

sh Server_Setup.sh
http://hostname.esri.com:6080/arcgis/manager
https://hostname.esri.com:6443/arcgis/manager

sh DataStore_Setup.sh
https://hostname.esri.com:2443/arcgis/datastore

sh Portal_Setup.sh
https://hostname.esri.com:7443/arcgis/home/