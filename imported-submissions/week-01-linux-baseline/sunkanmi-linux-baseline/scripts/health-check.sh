#!/bin/bash

echo "===== WEEK 1 HEALTH CHECK ====="
echo ""

# Timestamp
echo "Timestamp: $(date)"
echo ""

# Host identity
echo "Hostname:"
hostname
echo ""

# Uptime / load
echo "Uptime & Load:"
uptime
echo ""

# Memory usage
echo "Memory Usage:"
free -h
echo ""

# Disk usage + warning threshold
echo "Disk Usage:"
df -h

echo ""
echo "Disk Health Check:"
THRESHOLD=80

df -h | awk 'NR>1 {print $5 " " $1}' | while read usage partition
do
    usage_clean=$(echo $usage | tr -d '%')
    if [ "$usage_clean" -ge "$THRESHOLD" ]; then
        echo "WARNING: $partition is at ${usage}"
    fi
done

echo ""

# SSH service status
echo "SSH Service Status:"
systemctl is-active ssh
echo ""

# Additional service check (cron)
echo "CRON Service Status:"
systemctl is-active cron
echo ""

# Process check (top memory usage)
echo "Top Processes (by memory):"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo ""

echo "===== END OF HEALTH CHECK ====="
