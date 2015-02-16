FROM debian:wheezy
MAINTAINER mlecarme@bearstech.com

RUN apt-get update && apt-get install -y python-pip git
WORKDIR /opt
RUN git clone https://github.com/bearstech/grafana-store.git
RUN pip install -r grafana-store/requirements.txt

VOLUME /opt/data
EXPOSE 5000

CMD ["python", "/opt/grafana-store/src/grafanastore/app.py"]
