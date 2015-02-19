FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y curl strace

WORKDIR /tmp

ENV INFLUXDB_VERSION 0.8.8

RUN curl -s -o /tmp/influxdb_latest_amd64.deb https://s3.amazonaws.com/influxdb/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
dpkg -i /tmp/influxdb_latest_amd64.deb && \
rm /tmp/influxdb_latest_amd64.deb && \
rm -rf /var/lib/apt/lists/*

EXPOSE 8083
EXPOSE 8086

# RAFT stuff
EXPOSE 8090
EXPOSE 8099

COPY docker-entrypoint.sh /entrypoint.sh
COPY config.toml /etc/influxdb.toml

VOLUME /opt/influxdb/shared/data/

#USER influxdb

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/bin/influxdb", "-config=/etc/influxdb.toml"]
