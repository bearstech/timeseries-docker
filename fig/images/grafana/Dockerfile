FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y nginx curl && rm -rf /var/lib/apt/lists/*
RUN  echo "\ndaemon off;" >> /etc/nginx/nginx.conf

WORKDIR /src

ENV GRAFANA_VERSION 1.9.1

RUN curl http://grafanarel.s3.amazonaws.com/grafana-$GRAFANA_VERSION.tar.gz \
    | tar -xz && mv grafana-$GRAFANA_VERSION /var/www
COPY config.js /var/www/

EXPOSE 80

COPY website.conf /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/website.conf /etc/nginx/sites-enabled/

CMD ["nginx"]
