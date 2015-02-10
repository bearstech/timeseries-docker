FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y git scons gcc make nginx curl

RUN mkdir -p /src
WORKDIR /src

RUN curl -O http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
RUN dpkg -i influxdb_latest_amd64.deb
EXPOSE 8083
EXPOSE 8086

ENV GRAFANA_VERSION=1.9.1

RUN curl http://grafanarel.s3.amazonaws.com/grafana-$GRAFANA_VERSION.tar.gz | tar -xz

RUN mv grafana-$GRAFANA_VERSION /var/www
COPY config.js /var/www/

RUN git clone https://github.com/armon/statsite.git
WORKDIR /src/statsite
RUN mkdir -p /usr/local/bin /usr/local/lib/statsite /etc/statsite/
RUN make && cp statsite /usr/local/bin/ && cp -r sinks /usr/local/lib/statsite/
COPY statsite.ini /etc/statsite/
COPY influxdb.ini /etc/statsite/
EXPOSE 8125

COPY start.sh /
RUN chmod +x /start.sh

COPY website.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/website.conf /etc/nginx/sites-enabled/

EXPOSE 80
CMD /start.sh
