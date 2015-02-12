FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y python-dev python-virtualenv

RUN mkdir -p /opt/graphite && virtualenv /opt/graphite

WORKDIR /opt/graphite
RUN /opt/graphite/bin/pip install 'twisted<=11' \
    https://github.com/graphite-project/ceres/tarball/master whisper carbon
#RUN /opt/carbon/bin/pip install whisper
#RUN /opt/carbon/bin/pip install carbon
COPY carbon.conf /opt/graphite/conf/
COPY storage-schemas.conf /opt/graphite/conf/

EXPOSE 2003
VOLUME /opt/graphite/storage
CMD /opt/graphite/bin/carbon-cache.py start --debug
