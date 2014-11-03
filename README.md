Timeseries Docker
=================

Bring your own statsd everywhere.


    docker build -t timeseries .
    docker run -p 8080:80 -p 8125:8125 -p 8083:8083 -p 8086:8086 timeseries

Ports:

 * 80: Grafana
 * 8125: Statsite (both UDP and TCP)
 * 8083: Influxdb web
 * 8086: Influxdb API

Licence
=======

3 terms BSD licence, © 2014 Mathieu Lecarme.
