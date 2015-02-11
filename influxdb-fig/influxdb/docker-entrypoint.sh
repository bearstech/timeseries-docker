#!/bin/bash

chown -R influxdb /opt/influxdb/shared/data/
echo "Owned"

exec "$@"
