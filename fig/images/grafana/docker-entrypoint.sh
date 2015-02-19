#!/bon/bash

if [ "$TIMESERIES" eq "influxdb" ]; then
    cp /var/www/config-influxdb.js /var/www/config.js
fi

exec "$@"
