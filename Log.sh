#!/bin/bash

LOG_FILE="/var/log/log_monitoring.log"
WATCHED_LOGS=("/var/log/auth.log" "/var/log/syslog")

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting Log Monitoring..."

for LOG_PATH in "${WATCHED_LOGS[@]}"; do
    if [ -f "$LOG_PATH" ]; then
        log "Monitoring $LOG_PATH for suspicious activity..."
        sudo tail -F $LOG_PATH | grep --line-buffered -E "Failed|Error|Invalid|root" | tee -a $LOG_FILE
    else
        log "$LOG_PATH does not exist."
    fi
done

log "Log Monitoring completed."
