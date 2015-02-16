FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y python-virtualenv gcc python-dev python-cairo
RUN mkdir -p /opt/graphite && virtualenv /opt/graphite
RUN /opt/graphite/bin/pip install whisper graphite-web gunicorn "django<1.6" django-tagging pytz
RUN ln -s /usr/lib/pymodules/python2.7/cairo /opt/graphite/lib/python2.7/site-packages
COPY docker-entrypoint.sh /entrypoint.sh
COPY local_settings.py /opt/graphite/webapp/graphite/
COPY graphite.wsgi /opt/graphite/webapp/

WORKDIR /opt/graphite/webapp/graphite
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/opt/graphite/bin/python", "manage.py", "runserver", "0.0.0.0:8888"]

#CMD /opt/graphite/bin/gunicorn --workers 2 graphite.wsgi
