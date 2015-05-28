FROM debian:jessie
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y graphite-carbon

COPY carbon.conf /etc/carbon/
COPY storage-schemas.conf /etc/carbon/
COPY storage-aggregation.conf /etc/carbon/storage-aggregation.conf

EXPOSE 2003
VOLUME /var/lib/graphite/whisper/
CMD ["/usr/bin/carbon-cache", "--config=/etc/carbon/carbon.conf", "--pidfile=/tmp/carbon-cache.pid", "--debug", "start"]
