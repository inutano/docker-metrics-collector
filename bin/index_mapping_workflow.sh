curl --header "Content-Type:application/json" -XPUT localhost:9200/workflow -d '{
  "mappings": {
    "workflow_log": {
      "properties": {
        "workflow": {
          "properties": {
            "start_date": {"type": "date", "format": "yyyy-MM-dd HH:mm:ss"},
            "end_date": {"type": "date", "format": "yyyy-MM-dd HH:mm:ss"}
          }
        }
      }
    }
  }
}'
