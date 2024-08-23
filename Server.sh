#!/bin/bash

LOG_FILE="/var/log/server_hardening.log"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting Server Hardening..."

log "Configuring SSH..."
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
log "SSH configured successfully."
log "Securing file permissions..."
sudo chmod 600 /etc/shadow
sudo chmod 600 /etc/gshadow
sudo chmod 700 /root
log "File permissions secured successfully."

log "Server Hardening completed."
