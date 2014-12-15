FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get -q update
RUN apt-get -q upgrade -y
RUN apt-get -q install -y git scons gcc make nginx curl
RUN mkdir -p /src
WORKDIR /src

ADD http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb /src/
RUN dpkg -i influxdb_latest_amd64.deb
EXPOSE 8083
EXPOSE 8086

ADD http://grafanarel.s3.amazonaws.com/grafana-1.8.1.tar.gz /src/
RUN tar -xvzf grafana-1.8.1.tar.gz

RUN mkdir -p /var/www
RUN cp -r grafana-1.8.1/* /var/www/
ADD config.js /var/www/

RUN git clone https://github.com/armon/statsite.git
WORKDIR /src/statsite
RUN make
RUN mkdir -p /usr/local/bin
RUN mkdir -p /usr/local/lib/statsite
RUN cp statsite /usr/local/bin/
RUN cp -r sinks /usr/local/lib/statsite/
RUN mkdir -p /etc/statsite/
ADD statsite.ini /etc/statsite/
ADD influxdb.ini /etc/statsite/
EXPOSE 8125

ADD start.sh /
RUN chmod +x /start.sh

ADD website.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/website.conf /etc/nginx/sites-enabled/

EXPOSE 80
CMD /start.sh
