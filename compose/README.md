Timeseries, with a little help from Compose
===========================================

You can compose your timeseries stack.


Big picture
-----------

The cake recipe is :

    +--------+      +----------+
    | statsd |      | grafana  |
    +--------+---+  +----------+
    |   carbon   |  | graphite |
    +------------+--+----------+
    |           whisper        |
    +--------------------------+

Graphite is implemented by garphite-api + pypy.

Statsd is implemented by statsite.

Carbon is now a debian package.

The Dockerfile are in the images folder.

Use it
------


Choose your recipe, and taste it.

    docker-compose up -d

Find the mapped port for 80 on grafana container.

    docker-compose ps

Find the grafana mapped port, and open it with a web browser.
