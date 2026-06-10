#!/bin/bash

# ====================================================================
# Script Name: devops_tool.sh
# Description: Interactive operational menu dashboard for server upkeep.
# ====================================================================

# --- ISOLATED FUNCTIONS ---

check_cpu() {
    echo -e "\n=== 📊 LIVE CPU UTILIZATION ==="
    # Displays CPU architecture statistics and active processing idle breakdown
    top -bn1 | grep "Cpu(s)"
}

check_ram() {
    echo -e "\n=== 🧠 MEMORY BREAKDOWN (MB) ==="
    # Queries the kernel for active hardware memory layouts in standard megabytes
    free -m
}

restart_nginx() {
    echo -e "\n=== 🔄 RELOADING NGINX APPLICATION ENGINE ==="
    # Interacts with systemd process controls to perform a graceful reboot cycle
    sudo systemctl restart nginx
    if systemctl is-active --quiet nginx; then
        echo "✅ Nginx service successfully stabilized and listening on network ports."
    else
        echo "❌ EMERGENCY: Nginx process failed to recover!"
    fi
}

backup_logs() {
    echo -e "\n=== 📦 ARCHIVING TRANSACTION RECORDS ==="
    # Packages system logs securely into a compressed time-stamped archive
    BACKUP_DIR="./backups"
    mkdir -p "$BACKUP_DIR"
    TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
    
    # Simulating backup tracking target (creating a sample file if it doesn't exist)
    touch metric_monitor.log
    
    tar -czf "$BACKUP_DIR/log_backup_$TIMESTAMP.tar.gz" metric_monitor.log
    echo "✅ Telemetry history packed into backup storage: $BACKUP_DIR/log_backup_$TIMESTAMP.tar.gz"
}

# --- PERSISTENT EXECUTIVE EVALUATION LOOP ---

while true; do
    echo -e "\n================================="
    echo "  🌐 DEVOPS ADMINISTRATIVE PANEL "
    echo "================================="
    echo "1. Check Server CPU Performance"
    echo "2. Check Server RAM Allocation"
    echo "3. Restart Nginx Web Engine"
    echo "4. Archive System Metrics Logs"
    echo "5. Terminate Panel Session"
    echo "================================="
    echo -n "Enter operational directive [1-5]: "
    read CHOICE

    # --- STRUCTURAL MATCH SWITCH STATEMENT ---
    case $CHOICE in
        1) check_cpu ;;
        2) check_ram ;;
        3) restart_nginx ;;
        4) backup_logs ;;
        5)
            echo -e "\n👋 Closing administration panel session safely. Terminal clear."
            exit 0
            ;;
        *)
            echo -e "\n⚠️ Invalid input. Select an operational index between 1 and 5."
            ;;
    esac

    echo -e "\nPress [Enter] to return to the dashboard menu..."
    read
done
