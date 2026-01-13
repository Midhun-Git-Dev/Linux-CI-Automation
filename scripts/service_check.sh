#!/bin/bash

LOG_FILE="logs/ci_run.log"
SERVICE="ssh"

systemctl is-active --quiet $SERVICE

if [ $? -ne 0 ]; then
  echo "❌ $SERVICE service is NOT running" >> $LOG_FILE
  exit 1
fi

echo "✅ $SERVICE service is running" >> $LOG_FILE
exit 0

