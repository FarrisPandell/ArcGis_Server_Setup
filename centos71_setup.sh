#!/bin/bash

# update OS
echo Update OS...
sudo yum update -y

# update installation tools
echo Update Installation Tools
sudo yum install nano -y
sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install unzip -y
sudo yum install bind-utils -y

# mount CD-ROM
echo Mount CD-ROM...
sudo mkdir /mnt/cdrom
sudo mount /dev/sr0 /mnt/cdrom

# unzip certificates
unzip /mnt/cdrom/certificates.zip -d /home/cfarris

# setup keystore with certificates
rm /home/cfarris/.keystore
keytool -storepass changeit -genkey -alias tomcat -keyalg RSA -keypass changeit
keytool -importkeystore -srckeystore /home/cfarris/.keystore -srcstorepass changeit -destkeystore /home/cfarris/.keystore -deststoretype pkcs12 -deststorepass changeit
keytool -delete -alias tomcat -storepass changeit
keytool -v -importkeystore -srckeystore /home/cfarris/certificates/centos71.local.sleepingbearsystems.net.pfx -srcstoretype PKCS12

# sudo nano /et/security/limits.conf
# cfarris soft nofile 65536
# cfarris hard nofile 65536
# cfarris soft nproc 65536
# cfarris hard nproc 65536
# save and logout to apply changes