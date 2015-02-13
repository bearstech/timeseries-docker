#!/bin/bash
set -e

cd /opt/graphite/webapp/graphite
if [ ! -e /opt/graphite/storage/graphite.db ]; then
    /opt/graphite/bin/python manage.py syncdb --noinput
fi

exec "$@"
