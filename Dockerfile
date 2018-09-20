FROM tomcat:8

ADD ./webapp/taget/*.war /usr/local/tomat/webapps/

EXPOSE 8080

CMD ["cataliona.sh", "run"]