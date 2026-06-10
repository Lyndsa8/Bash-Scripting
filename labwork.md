# Week 3 — Systems Automation & DevOps Scripting Lab

## 1. Production Server Recovery Engine (Lab 1)

### Scenario Objective
Automate an immediate failover response to detect an unexpected service crash of the Nginx web server, execute a recovery restart sequence, and generate a persistent time-stamped log record.

### Automation Code Execution
The recovery mechanism was successfully compiled and is located inside:
`scripts/server_recovery.sh`

### Verification Log Details
When the Nginx service was deliberately terminated to simulate a midnight infrastructure crash, the script successfully triggered a recovery action.
