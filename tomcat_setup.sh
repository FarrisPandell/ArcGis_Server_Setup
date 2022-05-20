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

# nano /home/cfarris/tomcat9/webapps/host-manager/META-INF/context.xml 
# Add 192.168.50.* to <Valve allow="..."/>

# nano /home/cfarris/tomcat9/webapps/manager/META-INF/context.xml
# Add 192.168.50.* to <Valve allow="..."

# nano /home/cfarris/tomcat9/conf/tomcat-users.xml
# Uncomment out <user username="admin" .../> and <user username="robot" .../> entries
# Set passwords

# nano /home/cfarris/tomcat9/conf/server.xml
# Add the HTTPS connector
#<!-- Define an SSL Coyote HTTP/1.1 Connector on port 8443 -->
#<Connector
#           protocol="org.apache.coyote.http11.Http11NioProtocol"
#           port="8443" maxThreads="200"
#           scheme="https" secure="true" SSLEnabled="true"
#           keystoreFile="/home/cfarris/.keystore" keystorePass="changeit"
#           clientAuth="false" sslProtocol="TLS"/>

# sh /home/cfarris/tomcat9/bin/startup.sh