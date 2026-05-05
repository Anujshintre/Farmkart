FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY Farmkart.war /usr/local/tomcat/webapps/ROOT.war

# Copy custom server.xml
COPY server.xml /usr/local/tomcat/conf/server.xml

# Create startup script with proper port substitution
RUN echo '#!/bin/bash\n\
if [ -n "$PORT" ]; then\n\
    echo "Setting port to: $PORT"\n\
    sed -i "s/port=\"8080\"/port=\"$PORT\"/g" /usr/local/tomcat/conf/server.xml\n\
fi\n\
echo "Starting Tomcat with port: $(grep -oP '"'"'port="\K[0-9]+'"'"' /usr/local/tomcat/conf/server.xml | head -1)"\n\
catalina.sh run' > /usr/local/tomcat/bin/start.sh && \
chmod +x /usr/local/tomcat/bin/start.sh

CMD ["/usr/local/tomcat/bin/start.sh"]
