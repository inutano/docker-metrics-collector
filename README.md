# Docker metrics collector

## Prerequisites

- docker-compose (version 3)

## How it works

`docker-compose up` runs four containers named `elk`, `dmc-setup`, `telegraf`, and `fluentd`. `dmc-setup` creates index mapping on specified Elasticsearch endpoint. `telegraf` watches containers running on the same host except for `elk`, `fluentd`, and itself, then output `./log/telegraf/metrics.json`. `fluentd` send `metrics.json` to Elasticsearch server using `tail -f` method. Collected metrics data can be visualized via `http://localhost:5601` by Kibana.

## Get Started

### Launch Elasticserach/Telegraf/Fluentd on the same host

```
$ git clone https://github.com/inutano/docker-metrics-collector
$ cd docker-metrics-collector
$ docker-compose up &
```

and you're ready to collect resource usage from docker container execution!

### Send metrics data to an external Elasticsearch server

Use shell environment variable to set hostname and port of Elasticsearch.

```
$ git clone https://github.com/inutano/docker-metrics-collector
$ cd docker-metrics-collector
$ export ES_HOST=<your Elasticsearch endpoint>
$ export ES_PORT=<your Elasticsearch port number>
$ docker-compose up telegraf &
```
