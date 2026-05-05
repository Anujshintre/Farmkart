FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY Farmkart.war /usr/local/tomcat/webapps/ROOT.war

# Replace port dynamically
CMD ["sh", "-c", "sed -i 's/port=\"8080\"/port=\"'\"${PORT}\"'\"/g' /usr/local/tomcat/conf/server.xml && catalina.sh run"]
