FROM debian:jessie
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y curl libfontconfig
ENV GRAFANA_VERSION 2.0.2
WORKDIR /tmp

RUN curl --silent -O https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb && \
    dpkg -i grafana_${GRAFANA_VERSION}_amd64.deb && \
    rm grafana_${GRAFANA_VERSION}_amd64.deb

VOLUME /var/lib/grafana
EXPOSE 3000

COPY website.conf /etc/nginx/sites-available/default
COPY grafana.ini /etc/grafana/

WORKDIR /usr/share/grafana

CMD ["/usr/sbin/grafana-server", "-config=/etc/grafana/grafana.ini"]
