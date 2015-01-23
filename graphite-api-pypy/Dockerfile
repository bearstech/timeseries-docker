FROM debian:jessie
MAINTAINER mlecarme@bearstech.com

RUN apt-get -q update && apt-get install -y pypy libcairo2 curl

WORKDIR /src
RUN curl https://bootstrap.pypa.io/get-pip.py | pypy
RUN pip install graphite-api gunicorn
