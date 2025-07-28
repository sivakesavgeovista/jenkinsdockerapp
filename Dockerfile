FROM tomcat:9.0.107-jre8
 
COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war


