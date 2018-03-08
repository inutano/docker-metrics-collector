# Docker metrics collector

## Prerequisites

- docker-compose (version 3)

## How it works

`docker-compose up` runs three containers named `elk`, `telegraf`, and `fluentd`. `telegraf` watches containers running on the same host except for `elk`, `fluentd`, and itself, then output `./log/telegraf/metrics.json`. `fluentd` send `metrics.json` to Elasticsearch server using `tail -f` method. Collected metrics data can be visualized via `http://localhost:5601` by Kibana.

## Get Started

### Launch Elasticserach/Telegraf/Fluentd on the same host

```
$ git clone https://github.com/inutano/docker-metrics-collector
$ cd docker-metrics-collector
$ bash ./bin/setup.sh
$ docker-compose up &
$ bash ./bin/index_mapping.sh
```

and you're ready to collect resource usage from docker container execution!

### Send metrics data to an external Elasticsearch server

```
$ git clone https://github.com/inutano/docker-metrics-collector
$ cd docker-metrics-collector
$ bash ./bin/setup.sh
```

Edit `docker-compose.yml`

```
environment:
  - ES_HOST=<your Elasticsearch endpoint>
  - ES_PORT=<your Elasticsearch port number>
```

then run

```
$ docker-compose up telegraf &
$ docker-compose up fluentd &
$ export ES_HOST=<your Elasticsearch endpoint>
$ export ES_PORT=<your Elasticsearch port number>
$ bash ./bin/index_mapping.sh
```
