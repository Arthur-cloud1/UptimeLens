# UptimeLens

## The Problem
Most small teams and solo developers run servers without real visibility into their health. 
A container can silently crash, disk space can quietly fill up, or a deploy can fail — and 
nobody finds out until users complain. Enterprise tools like Datadog or New Relic solve this, 
but they're expensive and often overkill for a single server or small project — so many 
self-hosted setups end up running blind.

## The Solution
UptimeLens is a lightweight, self-hosted monitoring dashboard that watches a server's vital 
signs in real time — CPU, memory, disk usage, container status — and keeps a history of 
alerts and deployments. It's built to be simple enough to run on a single EC2 instance, 
while still giving the visibility that larger tools provide.

## Features (planned)
- Real-time CPU / memory / disk tracking
- Container status monitoring
- Alert history log
- Deployment history log
- Lightweight dashboard UI

## Tech Stack
- Node.js
- PostgreSQL
- Docker
- (dashboard framework — TBD)

## Status
🚧 In active development — built as a hands-on capstone project.
