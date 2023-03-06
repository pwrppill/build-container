FROM tomcat:9-jdk17
EXPOSE 8080
ADD ./thewebapp/target/thewebapp.war /usr/local/tomcat/webapps