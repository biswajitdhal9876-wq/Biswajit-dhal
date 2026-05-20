#!/bin/bash

# cpu_usage.sh
# Simple CPU utilization monitor script

INTERVAL=1

get_cpu_idle() {
    top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d. -f1
}

while true
do
    IDLE=$(get_cpu_idle)
    USAGE=$((100 - IDLE))

    echo "$(date '+%Y-%m-%d %H:%M:%S') CPU Usage: ${USAGE}%"

    sleep $INTERVAL
done