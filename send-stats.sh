#!/bin/bash
API_KEY=$(grep '^API_KEY=' /home/ubuntu/UptimeLens/.env | cut -d= -f2)
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
MEM=$(free -m | awk 'NR==2 {printf "%.1f", $3/$2*100}')
UPTIME=$(cut -d. -f1 /proc/uptime)

curl -s -X POST http://localhost:3000/stats \
  -H "Content-Type: application/json" \
  -H "x-api-key: $API_KEY" \
  -d "{\"disk_usage\": $DISK, \"memory_usage\": $MEM, \"uptime_seconds\": $UPTIME}"
