# Docker metrics collector

## Prerequisites

- docker-compose (version 3)

## How it works

`docker-compose up` runs three containers named `elk`, `telegraf`, and `fluentd`. `telegraf` watches containers running on the same host except for `elk`, `fluentd`, and itself, then output `./log/telegraf/metrics.json`. `fluentd` send `metrics.json` to elasticsearch server using `tail -f` method. Collected metrics data can be visualized via `http://localhost:5601` via Kibana.

## Get Started

### Launch elasticserach/telegraf/fluentd on the same host

```
$ git clone https://github.com/inutano/docker-metrics-collector
$ cd docker-metrics-collector
$ bash ./bin/setup.sh
$ docker-compose up &
$ bash ./bin/index_mapping.sh
```

and you're ready to collect resource usage from docker container execution!

### Send metrics data to an external elasticsearch server

```
$ git clone https://github.com/inutano/docker-metrics-collector
$ cd docker-metrics-collector
$ bash ./bin/setup.sh
```

Edit `docker-compose.yml`

```
environment:
  - ES_HOST=<your ElasticSearch endpoint>
  - ES_PORT=<your ElasticSearch port number>
```

then run

```
$ docker-compose up telegraf &
$ docker-compose up fluentd &
$ export ES_HOST=<your ElasticSearch endpoint>
$ export ES_PORT=<your ElasticSearch port number>
$ bash ./bin/index_mapping.sh
```
