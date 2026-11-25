#!/bin/bash
cd /home/ubuntu/UptimeLens || exit 1
git fetch -q origin main
if [ "$(git rev-parse HEAD)" != "$(git rev-parse origin/main)" ]; then
  git pull -q --ff-only origin main
  docker compose up -d --build >> /home/ubuntu/deploy.log 2>&1
  echo "$(date) deployed $(git rev-parse --short HEAD)" >> /home/ubuntu/deploy.log
fi
