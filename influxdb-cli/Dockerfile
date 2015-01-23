FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y curl
ENV NODE_VERSION=0.10.35
WORKDIR /opt
RUN curl http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz | tar -xz
RUN ln -s /opt/node-v$NODE_VERSION-linux-x64/bin/* /usr/local/bin
RUN npm install influxdb-cli -g
CMD influxdb-cli --pretty -h db -d $DB
