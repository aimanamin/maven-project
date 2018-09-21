FROM tomcat:8

COPY webapp/target/webapp.war /usr/local/tomcat/webapps/

EXPOSE 8080