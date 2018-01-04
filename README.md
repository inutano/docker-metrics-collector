# Docker metrics collector

## Docker Build

```
docker build -t docker-metrics-collector .
```


## Quick Start

### Telegraf

```
mkdir ./fluentd_log ./telegraf_log

docker run -d --name telegraf \
  -v $(pwd)/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/telegraf_log:/var/log/telegraf \
  -v $(pwd)/fluent.conf:/etc/fluent/fluent.conf:ro \
  -v $(pwd)/fluentd_log:/var/log/fluentd \
  docker-metrics-collector
```

### Fluentd

```
docker exec \
  -e ES_HOST=elasticsearch_endpoint_ip \
  -e ES_PORT=9200 \
  telegraf \
  fluentd --daemon fluentd.pid --log /var/log/fluentd/fluentd.log
```

not use Elasticsearch:
```
docker exec telegraf fluentd --daemon fluentd.pid --log /var/log/fluentd/fluentd.log
```
