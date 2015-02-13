FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y python-dev libffi-dev libcairo2 python-pip

RUN pip install graphite-api gunicorn
COPY graphite-api.yaml /etc/

EXPOSE 8888

CMD ["gunicorn", "-w2", "graphite_api.app:app", "-b", "0.0.0.0:8888"]
