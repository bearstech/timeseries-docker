FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get -q update
RUN apt-get -q upgrade -y
ADD http://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz /opt/
WORKDIR /opt
RUN tar -xvzf node*.gz
RUN ln -s /opt/node-v0.10.33-linux-x64/bin/* /usr/local/bin
RUN npm install influxdb-cli -g
CMD influxdb-cli --pretty -h db -d $DB
