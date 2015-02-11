FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y curl

WORKDIR /tmp

RUN curl -O http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb && \
    dpkg -i influxdb_latest_amd64.deb && \
    rm influxdb_latest_amd64.deb

EXPOSE 8083
EXPOSE 8086

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /opt/influxdb/shared/data/

#USER influxdb

#ENTRYPOINT /entrypoint.sh

CMD /usr/bin/influxdb -config=/opt/influxdb/shared/config.toml -stdout=true
