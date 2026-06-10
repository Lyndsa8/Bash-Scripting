#!/bin/bash

# 1. CREATE A TIME STAMP & A LOG FILE VARIABLE
# We want to know EXACTLY when the crash happened.
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_FILE="./server_recovery.log"

# 2. THE DETECTION PHASE
# We use 'systemctl is-active' to ask the OS if nginx is running.
# The 'if' statement checks the answer.
if systemctl is-active --quiet nginx; then
    
    # If it IS running, write a happy note to our log file and do nothing else.
    echo "[$TIMESTAMP] SUCCESS: Nginx is running perfectly." >> $LOG_FILE

else
    # 3. THE RECOVERY PHASE
    # If Nginx is NOT running, the script drops down here. 
    echo "[$TIMESTAMP] ALERT: Nginx has crashed! Attempting automatic restart..." >> $LOG_FILE
    
    # This is the command that actually forces Nginx to start back up.
    sudo systemctl restart nginx
    
    # 4. THE NOTIFICATION PHASE
    # Print a notification directly to the screen so we can see it.
    echo "[NOTIFICATION]: Nginx server recovery sequence has been executed!"

fi
