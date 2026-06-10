#!/bin/bash

# ====================================================================
# Script Name: monitor_metrics.sh
# Description: AWS EC2 simulation tool tracking system memory metrics.
# ====================================================================

# Set a danger threshold percentage (e.g., 80%)
THRESHOLD=80
LOG_FILE="./metric_monitor.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 1. Extract live memory utilization metrics using free and awk
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

echo "[$TIMESTAMP] Telemetry Check: Current Memory Usage is at ${MEMORY_USAGE}%"

# 2. Threshold evaluation loop
if [ "$MEMORY_USAGE" -gt "$THRESHOLD" ]; then
    echo "[$TIMESTAMP] 🚨 ALERT: Memory usage has breached safety threshold! (${MEMORY_USAGE}%)" >> $LOG_FILE
    echo "[WARNING]: AWS EC2 Instance running hot! Resource utilization threshold exceeded."
else
    echo "[$TIMESTAMP] SUCCESS: Memory metrics are nominal. (${MEMORY_USAGE}%)" >> $LOG_FILE
    echo "[INFO]: System health status stable."
fi
