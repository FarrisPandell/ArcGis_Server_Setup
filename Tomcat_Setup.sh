# install Java
sudo yum install java-1.8.0-openjdk-devel -y

# unzip Tomcat
cd /home/cfarris
tar -xf /mnt/cdrom/apache-tomcat-9.0.63.tar.gz -C /home/cfarris
mv apache-tomcat-9.0.63/ tomcat9
