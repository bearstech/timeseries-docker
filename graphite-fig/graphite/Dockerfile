FROM python:2-wheezy
MAINTAINER mlecarme@bearstech.com

RUN pip install whisper graphite-web gunicorn django-tagging pytz django \
    && cp /opt/graphite/conf/graphite.wsgi.example /opt/graphite/webapp/graphite/wsgi.py

RUN apt-get update \
    && apt-get -y --no-install-recommends install libcairo2-dev libcairo2 curl tar bzip2\
    && rm -r /var/lib/apt/lists/*

## Mirror of http://www.cairographics.org/releases/cairo-1.14.0.tar.xz
RUN mkdir /usr/src/pycairo \
    && curl -SL "http://cairographics.org/releases/py2cairo-1.10.0.tar.bz2" \
    | tar -xjC /usr/src/pycairo --strip-components=1 \
    && cd /usr/src/pycairo \
    && ./waf configure \
    && ./waf build \
    && ./waf install \
    && rm -rf /usr/src/pycairo

COPY docker-entrypoint.sh /entrypoint.sh
COPY local_settings.py /opt/graphite/webapp/graphite/

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /opt/graphite/webapp/graphite
CMD ["gunicorn", "-b", "0.0.0.0:8000", "--workers", "1", "wsgi"]

#CMD /opt/graphite/bin/gunicorn --workers 2 graphite.wsgi


