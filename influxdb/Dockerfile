FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get -q update
RUN apt-get -q upgrade -y
RUN apt-get -q install -y curl git scons gcc make nginx
WORKDIR /src

RUN curl -O http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
RUN dpkg -i influxdb_latest_amd64.deb
EXPOSE 8083
EXPOSE 8086

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

WORKDIR /src
RUN curl -O http://grafanarel.s3.amazonaws.com/grafana-1.8.1.tar.gz
RUN tar -xvzf grafana-1.8.1.tar.gz

RUN mkdir -p /var/www
RUN cp -r grafana-1.8.1/* /var/www/
ADD config.js /var/www/

ADD start.sh /
RUN chmod +x /start.sh

ADD website.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/website.conf /etc/nginx/sites-enabled/

EXPOSE 80
CMD /start.sh
