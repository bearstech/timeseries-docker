FROM debian:jessie
MAINTAINER mlecarme@bearstech.com

ENV STATSITE_VERSION 0.7.1

RUN apt-get update && apt-get install -y curl scons gcc make

WORKDIR /src/
RUN curl -L https://github.com/armon/statsite/archive/v$STATSITE_VERSION.tar.gz \
    | tar -xz && mv statsite-$STATSITE_VERSION statsite
WORKDIR /src/statsite
RUN make && \
    mkdir -p /usr/local/bin /usr/local/lib/statsite /etc/statsite/ && \
    cp statsite /usr/local/bin/ && cp -r sinks /usr/local/lib/statsite/
COPY statsite.ini /etc/statsite/
EXPOSE 8125

CMD ["/usr/local/bin/statsite", "-f", "/etc/statsite/statsite.ini"]
