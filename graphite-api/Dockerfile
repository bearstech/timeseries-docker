FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get -q update
RUN apt-get -q upgrade -y

RUN apt-get install -y python-dev libffi-dev libcairo2 python-virtualenv \
            curl git scons gcc nginx

RUN mkdir -p /opt/graphite-api
RUN virtualenv /opt/graphite-api
RUN /opt/graphite-api/bin/pip install graphite-api gunicorn
ADD graphite-api.yaml /etc/

RUN mkdir /opt/graphite
RUN virtualenv /opt/graphite
RUN /opt/graphite/bin/pip install 'twisted<=11'
RUN /opt/graphite/bin/pip install https://github.com/graphite-project/ceres/tarball/master
RUN /opt/graphite/bin/pip install whisper
RUN /opt/graphite/bin/pip install carbon
ADD carbon.conf /opt/graphite/conf/
ADD storage-schemas.conf /opt/graphite/conf/

WORKDIR /src
RUN curl -O http://grafanarel.s3.amazonaws.com/grafana-1.8.1.tar.gz
RUN tar -xvzf grafana-1.8.1.tar.gz

RUN mkdir -p /var/www
RUN cp -r grafana-1.8.1/* /var/www/
ADD config.js /var/www/

ADD website.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/website.conf /etc/nginx/sites-enabled/

EXPOSE 80

RUN git clone https://github.com/armon/statsite.git
WORKDIR /src/statsite
RUN make
RUN mkdir -p /usr/local/bin
RUN mkdir -p /usr/local/lib/statsite
RUN cp statsite /usr/local/bin/
RUN cp -r sinks /usr/local/lib/statsite/
RUN mkdir -p /etc/statsite/
ADD statsite.ini /etc/statsite/
EXPOSE 8125

ADD start.sh /
RUN chmod +x /start.sh
CMD /start.sh
