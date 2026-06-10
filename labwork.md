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
![Deployment Successful] (images/deployment_script.png)


