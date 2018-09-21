FROM tomcat:8

ADD ./*/taget/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["cataliona.sh", "run"]