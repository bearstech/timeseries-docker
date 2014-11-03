Timeseries Docker
=================

Bring your own statsd everywhere, and mesure everything.

[Satsd](https://github.com/etsy/statsd/) is the de facto standard tool for counting stuff.
Its protocol is simple, and UDP oriented.
UDP is used as fire and forget, you can mesure things inside your code without breaking it.
TCP works too, but the server needs to be up, and you are waiting for answer.

For this docker tool, [statsite](https://github.com/armon/statsite) is used.
Statsite is a C variant of statsd, a nodejs project.

Storage are handled by [Influxdb](http://influxdb.com/).
Graphic are handled by [Grafana](http://grafana.org).

Testing it
----------
You need [Docker](https://docker.com) with a recent kernel, or a [boot2docker](http://boot2docker.io) if you are not using Linux.


    docker build -t timeseries .
    docker run -p 8080:80 -p 8125:8125 -p 8083:8083 -p 8086:8086 timeseries

Ports:

 * 80: Grafana
 * 8125: Statsite (both UDP and TCP)
 * 8083: Influxdb web
 * 8086: Influxdb API

The password are dummies : admin/admin for using the _timeseries_ db in Influxdb, root/root for administrating Influxdb.

Just push some data to the port 8125 and watch what happens in Grafana.
You can push data with netcat, or using a libraray designed for your favorite language.

Licence
=======

3 terms BSD licence, © 2014 Mathieu Lecarme.
