#FROM tomcat:9.0.107-jre8
 
#COPY target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war


FROM oraclelinux:8.3  as Builder
LABEL "name"="mayank"
RUN dnf install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64  -y
RUN dnf install maven -y
RUN mkdir /javawebapp
WORKDIR /javawebapp
COPY . .
# to build project into war file
RUN mvn clean package

FROM tomcat
MAINTAINER mayank123modi@gmail.com
RUN mkdir  /myapp
COPY  --from=Builder  /javawebapp  /myapp
RUN cp -rvf  /myapp/target/java-web-app-1.0.war  /usr/local/tomcat/webapps/
RUN rm -rf /myapp
EXPOSE 8080
