# Docker metrics collector

## Get Started

```
$ git clone https://github.com/inutano/docker-metrics-collector
$ cd docker-metrics-collector
$ docker-compose up &
$ bash ./bin/index_mapping_telegraf.sh
```

and you're ready to collect resource usage from docker container execution!

### Use external elasticsearch server

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
```
