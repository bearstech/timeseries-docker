Timeseries, with a little help from fig
=======================================

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

There is different flavor of graphite :
 * graphite, the original, a Django application
 * graphite-api, a bare bone implementation, a Flask application
 * graphite-api-pypy, JIT python variant of graphite-api

The dashboards are stored in grafana-store, a fake elasticsearch, a dummy Flask application.

The Dockerfile are in the images folder.

Use it
------

Docker (local or distant with boot2docker), [fig](http://fig.sh).

Choose your recipe, and taste it.

    export FIG_FILE=fig-graphite-api.yml
    fig stop
    fig rm
    fig build
    fig up -d

Find the mapped port for 80 on grafana container.

    fig ps

Futur
-----

Fig will become docker-compose.

Using Influxdb instead of carbon/graphite/whisper.
