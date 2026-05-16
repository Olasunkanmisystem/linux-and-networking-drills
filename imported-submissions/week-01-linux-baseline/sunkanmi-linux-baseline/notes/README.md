# Week 1 Linux Baseline Submission

## Overview
This project builds a simple Linux system monitoring and automation setup using Bash and cron.

## What was built

### 1. Working Directory
linux-work/
- scripts → contains health-check automation script
- evidence → stores cron execution logs
- notes → documentation and handover files

### 2. Health Check Script
Collects system metrics:
- timestamp
- hostname
- uptime
- memory usage
- disk usage
- SSH service status
- cron service status
- top processes
- memory usage warning

### 3. Automation
Script runs automatically every 5 minutes using cron:

*/5 * * * * /bin/bash /home/sunkanmi/linux-work/scripts/health-check.sh >> /home/sunkanmi/linux-work/evidence/health-check-output.txt 2>&1

### 4. Evidence
All execution output is stored in:
evidence/health-check-output.txt

## Outcome
A working automated Linux health monitoring system with persistent logs and structured documentation.
