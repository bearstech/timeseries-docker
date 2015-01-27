FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y git mercurial sed make curl gcc vim
# vim provides xxd

ENV PROMETHEUS_VERSION=0.10.0

WORKDIR /src
RUN git clone --progress https://github.com/prometheus/prometheus.git prometheus

WORKDIR /src/prometheus
RUN git checkout $PROMETHEUS_VERSION
RUN make build
