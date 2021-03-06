#!/bin/sh

# Set variables
ES_HOST=${ES_HOST:-localhost}
ES_PORT=${ES_PORT:-9200}

# Wait until elasticsearch is up
while [[ -z "$(curl -s ${ES_HOST}:${ES_PORT})" ]]; do
  echo "waiting for Elasticsearch to be up"
  sleep 1
done

# Create index mapping
script_dir="$(cd $(dirname ${0}) && pwd -P)"
. "${script_dir}/index_mapping_telegraf.sh"
. "${script_dir}/index_mapping_workflow.sh"

# Check if index properly created
telegraf_ep="${ES_HOST}:${ES_PORT}/telegraf"
workflow_ep="${ES_HOST}:${ES_PORT}/workflow"
echo -e "\n\nIndex mapping done - Endpoint: ${telegraf_ep}"
curl -s "${telegraf_ep}"
echo -e "\n\nIndex mapping done - Endpoint: ${workflow_ep}"
curl -s "${workflow_ep}"
