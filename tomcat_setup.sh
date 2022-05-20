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
rm /home/cfarris/.keystore
keytool -storepass changeit -genkey -alias tomcat -keyalg RSA -keypass changeit
keytool -importkeystore -srckeystore /home/cfarris/.keystore -srcstorepass changeit -destkeystore /home/cfarris/.keystore -deststoretype pkcs12 -deststorepass changeit
keytool -v -importkeystore -srckeystore /home/cfarris/certificates/centos71.local.sleepingbearsystems.net.pfx -srcstoretype PKCS12 -alias centos71
keytool -v -importkeystore -srckeystore /home/cfarris/certificates/centos72.local.sleepingbearsystems.net.pfx -srcstoretype PKCS12 -alias centos72