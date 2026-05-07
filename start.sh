#!/bin/bash

wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.105/bin/apache-tomcat-9.0.105.tar.gz

tar -xzf apache-tomcat-9.0.105.tar.gz

cp Farmkart.war apache-tomcat-9.0.105/webapps/ROOT.war

cd apache-tomcat-9.0.105/bin

chmod +x catalina.sh

./catalina.sh run
