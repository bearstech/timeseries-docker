#!/bin/sh

/opt/graphite/bin/carbon-cache.py start
/etc/init.d/nginx start

/opt/graphite-api/bin/gunicorn -w2 graphite_api.app:app -b 127.0.0.1:8888
