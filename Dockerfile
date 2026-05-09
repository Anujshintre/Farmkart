FROM tomcat:9.0-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY Farmkart.war /usr/local/tomcat/webapps/ROOT.war

# Make sure Tomcat binds to all interfaces
ENV CATALINA_OPTS="-Djava.net.preferIPv4Stack=true"

EXPOSE 8080

# Use the PORT environment variable if provided (Railway), fallback to 8080
CMD ["catalina.sh", "run"]
