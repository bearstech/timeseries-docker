#!/bin/bash
sleep 5
curl -v -X POST 'http://influxdb:8086/db?u=root&p=root' \
  -d '{"name": "grafana"}'  2> /dev/null

curl -v -X POST 'http://influxdb:8086/db/grafana/users?u=root&p=root' \
  -d '{"name": "admin", "password": "admin"}'  2> /dev/null

exec "$@"
