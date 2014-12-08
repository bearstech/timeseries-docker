#!/bin/sh

/etc/init.d/influxdb start
/etc/init.d/nginx start
sleep 10
curl -v -X POST 'http://localhost:8086/db?u=root&p=root' \
  -d '{"name": "timeseries"}'
curl -v -X POST 'http://localhost:8086/db?u=root&p=root' \
  -d '{"name": "grafana"}'
curl -v -X POST 'http://localhost:8086/db/timeseries/users?u=root&p=root' \
  -d '{"name": "admin", "password": "admin"}'
curl -v -X POST 'http://localhost:8086/db/grafana/users?u=root&p=root' \
  -d '{"name": "admin", "password": "admin"}'

/usr/local/bin/statsite -f /etc/statsite/statsite.ini
