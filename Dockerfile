FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia

ADD . /home/nubomedia

ENTRYPOINT mysql -u"$mysql_MYSQL_USER" -p"$mysql_MYSQL_PASSWORD" "$mysql_MYSQL_DATABASE" -h "$mysql_host" < /home/nubomedia/src/main/resources/mysql.sql && cd /home/nubomedia && mvn spring-boot:run
