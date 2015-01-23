FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y python-dev libffi-dev libcairo2\
    python-virtualenv curl git scons gcc nginx

RUN mkdir -p /opt/graphite-api && virtualenv /opt/graphite-api
RUN /opt/graphite-api/bin/pip install graphite-api gunicorn
COPY graphite-api.yaml /etc/

RUN mkdir /opt/graphite && virtualenv /opt/graphite
RUN /opt/graphite/bin/pip install 'twisted<=11'
RUN /opt/graphite/bin/pip install https://github.com/graphite-project/ceres/tarball/master
RUN /opt/graphite/bin/pip install whisper
RUN /opt/graphite/bin/pip install carbon
COPY carbon.conf /opt/graphite/conf/
COPY storage-schemas.conf /opt/graphite/conf/

ENV GRAFANA_VERSION=1.8.1

WORKDIR /src
RUN curl http://grafanarel.s3.amazonaws.com/grafana-$GRAFANA_VERSION.tar.gz | tar -xz

RUN mv /src/grafana-$GRAFANA_VERSION /var/www
COPY config.js /var/www/

COPY website.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/website.conf /etc/nginx/sites-enabled/

EXPOSE 80

RUN git clone https://github.com/armon/statsite.git
WORKDIR /src/statsite
RUN make
RUN mkdir -p /usr/local/bin /usr/local/lib/statsite /etc/statsite/
RUN cp statsite /usr/local/bin/
RUN cp -r sinks /usr/local/lib/statsite/
COPY statsite.ini /etc/statsite/
EXPOSE 8125

COPY start.sh /
RUN chmod +x /start.sh
CMD /start.sh
