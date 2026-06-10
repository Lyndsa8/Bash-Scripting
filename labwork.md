# 🚀 Week 3 — Systems Automation & DevOps Scripting Lab

## 1. Production Server Recovery Engine (Lab 1)

### 📋 Scenario
Nginx crashes at midnight. Create automation that:
* Detects failure
* Restarts nginx
* Logs issue
* Sends notification

### 💻 Terminal Success Verification
![Lab 1 Terminal Success Output](images/server_recovery.png)

## 2. DevOps Deployment Script (Lab 2)

### 📋 Scenario
A software development team pushes a new feature update to GitHub. Instead of manually updating the application server, a single automated deployment pipeline must be executed to refresh the server safely. The system must:
* Pull the latest codebase updates directly from GitHub.
* Clear out legacy data buffers and temporary cache files.
* Restart the underlying core web application service.
* Perform a post-deployment health check to verify system stability.

### ⚙️ How the Automation Works (Step-by-Step)

1. **Upstream Code Synchronization:** The pipeline initiates by contacting the remote repository repository on GitHub. It automatically scans for new modifications and synchronizes the local application folder with the cloud infrastructure.
2. **Cache Isolation & Cleansing:** To eliminate conflicts between old data variables and the fresh update, the system forcefully purges the contents of the temporary runtime storage directory.
3. **Core Engine Restart:** The pipeline communicates directly with the Linux operating system's process manager to drop the active system memory state of the Nginx web server and trigger a graceful restart, instantly loading the new deployment.
4. **Service Health Telemetry Verification:** Finally, the script queries the live runtime status of the application. If the server responds with a healthy execution signal, a success confirmation is generated. If an unexpected crash occurs, the pipeline raises an emergency stop flag to alert the engineering team.

### 💻 Terminal Success Verification
![Deployment Successful](images/deployment_script.png)

# 📊 Lab 3 — AWS EC2 Metric Monitor

> A lightweight infrastructure monitoring tool deployed directly on an AWS EC2 instance, designed to provide continuous visibility over cloud-based virtual machines and prevent unexpected downtime.

---

## Table of Contents

1. [Project Objective](#project-objective)
2. [Architectural Workflow](#architectural-workflow)
3. [Terminal Success Verification](#terminal-success-verification)

---

## Project Objective

An infrastructure operations team needs to maintain continuous visibility over their cloud-based virtual machines without forcing engineers to monitor server statistics around the clock. This automation agent is designed to:

- Extract real-time resource telemetry metrics including memory usage and capacity constraints
- Evaluate active resource metrics against defined infrastructure safety limits
- Automatically flag performance anomalies and generate system alerts under peak loads
- Maintain a persistent history log to preserve an audit trail for future capacity planning

---

## Architectural Workflow

### 1. Telemetry Metric Extraction

The automated monitoring script interfaces directly with the underlying Linux OS kernel to pull live hardware utilization performance numbers, calculating precise memory allocation statistics.

### 2. Threshold Evaluation Loop

The script acts as an internal logic gate, instantly running the extracted performance data against a hardcoded system threshold (e.g., **80% utilization capacity limit**) to analyze infrastructure strain.

### 3. Dynamic Alerting System

If real-time resource usage breaches the preconfigured safety limit, the pipeline immediately triggers an elevated warning flag in the console log to alert engineers that the server is running hot.

### 4. Persistent Log Archiving

To ensure compliance and support post-incident reviews, the tool appends a formatted entry containing a precise timestamp and metric values into a local monitoring log file during every evaluation cycle.

---

## Terminal Success Verification

![Lab 3 Successful](images/monitor_metric)

