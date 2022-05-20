#!/bin/bash

# update OS
echo Update OS...
sudo yum update -y

# update installation tools
echo Update Installation Tools
sudo yum install nano -y
sudo yum install epel-release -y
sudo yum install xrdp -y

# mount CD-ROM
echo Mount CD-ROM...
sudo mkdir /mnt/cdrom
sudo mount /dev/sr0 /mnt/cdrom

# start xrdp
sudo firewall-cmd --add-port=3389/tcp --zone=public --permanent
sudo firewall-cmd --reload
sudo systemctl enable xrdp
sudo systemctl start xrdp

# unzip certificates
unzip /mnt/cdrom/certificates.zip -d /home/cfarris/certificates

# setup keystore with certificates
rm /home/cfarris/.keystore
keytool -storepass changeit -genkey -alias tomcat -keyalg RSA -keypass changeit
keytool -importkeystore -srckeystore /home/cfarris/.keystore -srcstorepass changeit -destkeystore /home/cfarris/.keystore -deststoretype pkcs12 -deststorepass changeit
keytool -delete -alias tomcat -storepass changeit
keytool -v -importkeystore -srckeystore /home/cfarris/certificates/centos72.local.sleepingbearsystems.net.pfx -srcstoretype PKCS12
