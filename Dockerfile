FROM nubomedia/apps-baseimage:src

MAINTAINER Nubomedia
USER root
RUN apk add --no-cache mysql-client

ADD . /home/nubomedia

ENTRYPOINT mysql -u"$MYSQL_MYSQL_USER" -p"$MYSQL_MYSQL_PASSWORD" "$MYSQL_MYSQL_DATABASE" -h "$MYSQL_HOST" < /home/nubomedia/src/main/resources/mysql.sql && cd /home/nubomedia && mvn spring-boot:run -Denforcer.skip=true
