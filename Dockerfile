FROM tomcat:9-jdk17

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy your WAR
COPY Farmkart.war /usr/local/tomcat/webapps/ROOT.war

# Create startup script
RUN printf '#!/bin/bash\n\
if [ -n "$PORT" ]; then\n\
    echo "Railway assigned PORT: $PORT"\n\
    sed -i "s/port=\\"8080\\"/port=\\"$PORT\\"/g" /usr/local/tomcat/conf/server.xml\n\
    echo "Tomcat now listening on port: $PORT"\n\
else\n\
    echo "PORT not set, using default 8080"\n\
fi\n\
grep -A1 "Connector port" /usr/local/tomcat/conf/server.xml | head -2\n\
exec catalina.sh run\n' > /usr/local/tomcat/bin/railway-start.sh && \
chmod +x /usr/local/tomcat/bin/railway-start.sh

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/railway-start.sh"]
