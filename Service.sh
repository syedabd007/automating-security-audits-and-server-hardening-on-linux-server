#!/bin/bash

LOG_FILE="/var/log/service_audit.log"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting Service Audit..."

log "Listing all running services:"
sudo systemctl list-units --type=service --state=running | tee -a $LOG_FILE

UNNECESSARY_SERVICES=("telnet" "rsh-server" "xinetd" "vsftpd")

for SERVICE in "${UNNECESSARY_SERVICES[@]}"; do
    if systemctl is-active --quiet $SERVICE; then
        log "$SERVICE is running and may be unnecessary."
    fi
done

log "Service Audit completed."

