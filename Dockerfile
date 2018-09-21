FROM tomcat:8

ADD '/var/lib/jenkins/workspace/Tomcat webapp/webapp/taget/webapp.war' /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["cataliona.sh", "run"]