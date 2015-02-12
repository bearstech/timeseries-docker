FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y python-dev libffi-dev libcairo2\
    python-virtualenv

RUN mkdir -p /opt/graphite-api && virtualenv /opt/graphite-api
RUN /opt/graphite-api/bin/pip install graphite-api gunicorn
COPY graphite-api.yaml /etc/

EXPOSE 8888

CMD /opt/graphite-api/bin/gunicorn -w4 graphite_api.app:app -b 0.0.0.0:8888
