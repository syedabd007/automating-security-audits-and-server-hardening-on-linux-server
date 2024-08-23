#!/bin/bash


LOG_FILE="/var/log/firewall_network_audit.log"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting Firewall and Network Security Audit..."

log "Checking UFW status:"
sudo ufw status verbose | tee -a $LOG_FILE

log "Listing open network ports:"
sudo netstat -tuln | tee -a $LOG_FILE

log "Firewall and Network Security Audit completed."

