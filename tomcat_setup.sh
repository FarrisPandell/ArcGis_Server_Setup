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