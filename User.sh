#!/bin/bash
LOG_FILE="/var/log/user_group_audit.log"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting User and Group Audits..."

log "Listing all users on the system:"
cut -d: -f1 /etc/passwd | tee -a $LOG_FILE

log "Listing all groups on the system:"
cut -d: -f1 /etc/group | tee -a $LOG_FILE

log "Checking for users with UID 0:"
awk -F: '($3 == "0") {print $1}' /etc/passwd | tee -a $LOG_FILE

log "Checking for users without passwords:"
sudo awk -F: '($2 == "" ) {print $1}' /etc/shadow | tee -a $LOG_FILE

log "Checking for expired user accounts:"
sudo chage -l $(cut -d: -f1 /etc/passwd) | grep 'Account expires' | tee -a $LOG_FILE

log "User and Group Audits completed."
