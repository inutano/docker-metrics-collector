#!/bin/bash

# Create log file directory
bin_dir="$(cd $(dirname ${0}) && pwd -P)"
log_dir="${bin_dir}/../log"
telegraf_log_dir="${log_dir}/telegraf"
fluentd_log_dir="${log_dir}/fluentd"
mkdir -p "${telegraf_log_dir}" "${fluentd_log_dir}"
