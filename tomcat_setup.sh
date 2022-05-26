# open Tomcat ports
echo Opening Ports...
sudo firewall-cmd --add-masquerade
sudo firewall-cmd --add-port=80/tcp --zone=public --permanent
sudo firewall-cmd --add-port=443/tcp --zone=public --permanent
sudo firewall-cmd --add-port=8080/tcp --zone=public --permanent
sudo firewall-cmd --add-port=8443/tcp --zone=public --permanent
sudo firewall-cmd --permanent --add-forward-port=port=80:proto=tcp:toport=8080
sudo firewall-cmd --permanent --add-forward-port=port=443:proto=tcp:toport=8443
sudo firewall-cmd --permanent --direct --add-rule ipv4 nat OUTPUT 0 -p tcp -o lo --dport 80 -j REDIRECT --to-ports 8080
sudo firewall-cmd --permanent --direct --add-rule ipv4 nat OUTPUT 0 -p tcp -o lo --dport 443 -j REDIRECT --to-ports 8443
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