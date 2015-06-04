FROM debian:jessie
MAINTAINER mlecarme@bearstech.com

RUN apt-get -q update && apt-get install -y pypy libcairo2 curl libffi-dev

WORKDIR /src
RUN curl https://bootstrap.pypa.io/get-pip.py | pypy
RUN pip install graphite-api gunicorn
COPY graphite-api.yaml /etc/

EXPOSE 8888

CMD ["gunicorn", "-w2", "graphite_api.app:app", "-b", "0.0.0.0:8888"]
