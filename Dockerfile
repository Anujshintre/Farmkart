FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY Farmkart.war /usr/local/tomcat/webapps/ROOT.war

# Create startup script for Railway
RUN echo '#!/bin/bash\n\
# Railway provides PORT variable\n\
if [ -n "$PORT" ]; then\n\
    echo "Railway assigned PORT: $PORT"\n\
    # Replace the connector port in server.xml\n\
    sed -i "s/port=\"8080\"/port=\"$PORT\"/g" /usr/local/tomcat/conf/server.xml\n\
    echo "Tomcat now listening on port: $PORT"\n\
else\n\
    echo "PORT not set, using default 8080"\n\
fi\n\
# Show the configured port for debugging\n\
grep -A1 "Connector port" /usr/local/tomcat/conf/server.xml | head -2\n\
catalina.sh run' > /usr/local/tomcat/bin/railway-start.sh && \
chmod +x /usr/local/tomcat/bin/railway-start.sh

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/railway-start.sh"]
