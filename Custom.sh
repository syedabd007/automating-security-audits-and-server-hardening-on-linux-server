#!/bin/bash

LOG_FILE="/var/log/custom_security_checks.log"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting Custom Security Checks..."

log "Checking for world-writable files..."
sudo find / -xdev -type f -perm -0002 -exec ls -l {} \; | tee -a $LOG_FILE

log "Checking for SSH on non-standard ports..."
sudo netstat -tuln | grep -E ':22|:2222' | tee -a $LOG_FILE

log "Custom Security Checks completed."
