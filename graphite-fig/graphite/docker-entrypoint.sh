#!/bin/bash

cd /opt/graphite/webapp/graphite /opt/graphite/bin/python manage.py syncdb


exec "$@"
