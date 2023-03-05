FROM tomcat:9-jdk17
EXPOSE 8080
ADD ./thewebapp/target/thewebapp.war /usr/local/tomcat/webapps

# Confugure ssh client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa