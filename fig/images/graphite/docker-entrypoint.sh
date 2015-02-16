#!/bin/bash
set -e

cd /opt/graphite/webapp/graphite
if [ ! -e /opt/graphite/storage/graphite.db ]; then
    /opt/graphite/bin/python manage.py syncdb --noinput
else
    echo "Using old database"
fi
mkdir -p /opt/graphite/storage/log/webapp

exec "$@"
