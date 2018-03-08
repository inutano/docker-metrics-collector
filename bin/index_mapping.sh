#!/bin/bash

# Set variables
ES_HOST=${ES_HOST:-localhost}
ES_PORT=${ES_PORT:-9200}


# Wait until elasticsearch is up
while [[ -z `curl -s ${ES_HOST}:${ES_PORT}` ]]; do
  sleep 5
done

# Create index mapping
bin_dir="$(cd $(dirname ${0}) && pwd -P)"
. "${bin_dir}/index_mapping_telegraf.sh"
. "${bin_dir}/index_mapping_workflow.sh"

# Check if index properly created
telegraf_ep="${ES_HOST}:${ES_PORT}/telegraf"
workflow_ep="${ES_HOST}:${ES_PORT}/workflow"
echo -e "\n\nEndpoint: ${telegraf_ep}"
curl "${telegraf_ep}"
echo -e "\n\nEndpoint: ${workflow_ep}"
curl "${workflow_ep}"
