#!/bin/bash

rm -f /opt/graphite/storage/carbon-cache-a.pid

exec "$@"
