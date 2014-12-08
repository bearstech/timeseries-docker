FROM debian:jessie
MAINTAINER mlecarme@bearstech.com

RUN apt-get -q update
RUN apt-get -q upgrade -y

RUN apt-get install -y pypy libcairo2

ADD https://bootstrap.pypa.io/get-pip.py /tmp/
RUN pypy /tmp/get-pip.py
RUN pip install graphite-api gunicorn
