#!/bin/bash

# Download Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.52/bin/apache-tomcat-10.1.52.tar.gz

# Extract
tar -xzf apache-tomcat-10.1.52.tar.gz

# Copy your WAR file as ROOT (so app runs on base URL)
cp Farmkart.war apache-tomcat-10.1.52/webapps/ROOT.war

# Go to Tomcat bin directory
cd apache-tomcat-10.1.52/bin

# Start Tomcat
./catalina.sh run
