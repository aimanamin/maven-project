FROM tomcat:8

WORKDIR /var/lib/jenkins/workspace/Tomcat webapp

ADD ./webapp/taget/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["cataliona.sh", "run"]