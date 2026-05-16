# Week 1 Server Baseline – Handover Notes

## Machine Details
- Host: EC2 Linux instance
- Hostname: ip-172-31-18-193
- Access method: SSH terminal session

---

## User Account
- User: sunkanmi
- Privileges: standard user with sudo access

---

## Working Directory
All work is located in:

/week01-submissions/sunkanmi-linux-baseline

### Project Structure:
- scripts/ → automation scripts
- notes/ → documentation files
- evidence/ → output files from script runs

---

## Health Check Script
Location:

/week01-submissions/sunkanmi-linux-baseline/scripts/health-check.sh

### Purpose:
Provides system operational snapshot:
- timestamp
- hostname
- uptime / load average
- memory usage
- disk usage
- SSH service status
- cron service status
- top processes
- memory threshold check

---

## Automation (Cron Job)

The script runs every 5 minutes:

*/5 * * * * /bin/bash /week01-submissions/sunkanmi-linux-baseline/scripts/health-check.sh >> /week01-submissions/sunkanmi-linux-baseline/evidence/health-check-output.txt 2>&1

---

## Output Location
All automated results are stored in:

/week01-submissions/sunkanmi-linux-baseline/evidence/health-check-output.txt

---

## Evidence Files
The following artifacts are maintained for validation:

- system-info.txt → system details snapshot
- users-and-groups.txt → user/group audit
- permissions-proof.txt → file permission checks
- services-proof.txt → running services validation
- cron-proof.txt → cron configuration proof
- health-check-output.txt → automated script output

---

## Assumptions / Limitations
- systemd is available and running
- cron service is active
- no log rotation configured
- single-user test environment on shared EC2 instance
