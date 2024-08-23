#!/bin/bash
LOG_FILE="/var/log/file_permission_audit.log"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

log "Starting File and Directory Permissions Audit..."

FILES=("/etc/passwd" "/etc/shadow" "/etc/gshadow" "/root" "/etc/ssh/sshd_config")

for FILE in "${FILES[@]}"; do
    if [ -e "$FILE" ]; then
        log "Permissions for $FILE: $(stat -c "%a %n" $FILE)"
    else
        log "$FILE does not exist."
    fi
done

log "File and Directory Permissions Audit completed."
