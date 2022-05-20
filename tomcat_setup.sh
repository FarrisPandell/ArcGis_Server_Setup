# install Java
sudo yum install java-1.8.0-openjdk-devel -y

# open Tomcat ports
echo Opening Ports...
sudo firewall-cmd --add-port=8080/tcp --zone=public --permanent
sudo firewall-cmd --add-port=8443/tcp --zone=public --permanent
# reload firewall
sudo firewall-cmd --reload

# unzip Tomcat
cd /home/cfarris
tar -xf /mnt/cdrom/apache-tomcat-9.0.63.tar.gz -C /home/cfarris
mv apache-tomcat-9.0.63/ tomcat9

# setup keystore with certificates
keytool -genkey -alias tomcat -keyalg RSA
keytool -v -importkeystore -srckeystore /home/cfarris/Downloads/certificates/centos71.local.sleepingbearsystems.net.pfx -srcstoretype PKCS12 -alias centos71
keytool -v -importkeystore -srckeystore /home/cfarris/Downloads/certificates/centos72.local.sleepingbearsystems.net.pfx -srcstoretype PKCS12 -alias centos72