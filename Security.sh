#!/bin/bash

LOG_FILE="/var/log/security_updates.log"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting Security Updates and Patching..."

log "Updating system packages..."
sudo apt-get update -y && sudo apt-get upgrade -y | tee -a $LOG_FILE

log "Applying pending security patches..."
sudo apt-get dist-upgrade -y | tee -a $LOG_FILE

log "Security Updates and Patching completed."

