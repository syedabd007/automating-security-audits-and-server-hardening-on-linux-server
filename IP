#!/bin/bash
LOG_FILE="/var/log/network_config_audit.log"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting IP and Network Configuration Checks..."

log "Displaying network interfaces and their IP addresses:"
ip -4 addr show | tee -a $LOG_FILE
ip -6 addr show | tee -a $LOG_FILE

log "Checking for IPv6 configuration:"
if sysctl net.ipv6.conf.all.disable_ipv6 | grep -q "= 1"; then
    log "IPv6 is disabled."
else
    log "IPv6 is enabled."
fi

log "IP and Network Configuration Checks completed."
