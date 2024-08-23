#!/bin/bash
LOG_FILE="/var/log/security_audit_report.log"
ALERT_EMAIL="admin@example.com"

log() {
    echo "$(date): $1" | tee -a $LOG_FILE
}

send_alert() {
    local message=$1
    echo "$message" | mail -s "Security Alert" $ALERT_EMAIL
}

log "Starting Reporting and Alerting..."

log "Generating security audit summary report..."
echo "Security Audit Report - $(date)" | tee -a $LOG_FILE
echo "===================================" | tee -a $LOG_FILEcat /var/log/user_group_audit.log /var/log/service_audit.log /var/log/file_permission_audit.log >> $LOG_FILE

log "Checking for critical issues..."
if grep -q "ERROR" $LOG_FILE; then
    log "Critical issues found! Sending alert..."
    send_alert "Critical issues were found during the security audit. Please review the report."
fi

log "Reporting and Alerting completed."
