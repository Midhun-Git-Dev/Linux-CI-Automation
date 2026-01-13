#!/bin/bash

LOG_FILE="logs/ci_run.log"
DATE=$(date)

echo "=============================" >> $LOG_FILE
echo "System Health Check - $DATE" >> $LOG_FILE
echo "=============================" >> $LOG_FILE

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2}')

echo "CPU Usage: $CPU%" >> $LOG_FILE
echo "Memory Usage: $MEM%" >> $LOG_FILE

if (( $(echo "$CPU > 90" | bc -l) )); then
  echo "❌ High CPU usage" >> $LOG_FILE
  exit 1
fi

echo "✅ System health OK" >> $LOG_FILE
exit 0

