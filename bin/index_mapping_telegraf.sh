curl --header "Content-Type:application/json" -XPUT localhost:9200/telegraf -d '{
  "mappings": {
    "docker_metrics": {
      "properties": {
        "timestamp": {"type": "date", "format": "epoch_second"}
      }
    }
  }
}'
