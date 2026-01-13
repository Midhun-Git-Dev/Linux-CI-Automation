#!/bin/bash

LOG_FILE="logs/ci_run.log"
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk Usage: $DISK_USAGE%" >> $LOG_FILE

if [ "$DISK_USAGE" -gt 80 ]; then
  echo "❌ Disk usage exceeded threshold" >> $LOG_FILE
  exit 1
fi

echo "✅ Disk usage under control" >> $LOG_FILE
exit 0

