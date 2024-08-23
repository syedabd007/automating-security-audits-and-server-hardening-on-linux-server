# Linux Server Security Automation Project

This project provides a collection of Bash scripts designed to automate security audits and hardening on Linux servers. Each script focuses on a specific aspect of system security, from user and group audits to firewall configuration, network monitoring, and more. The scripts are modular, allowing for easy integration and customization.

## Table of Contents

1. [User and Group Audits](#user-and-group-audits)
2. [File and Directory Permissions](#file-and-directory-permissions)
3. [Service Audits](#service-audits)
4. [Firewall and Network Security](#firewall-and-network-security)
5. [IP and Network Configuration Checks](#ip-and-network-configuration-checks)
6. [Security Updates and Patching](#security-updates-and-patching)
7. [Log Monitoring](#log-monitoring)
8. [Server Hardening Steps](#server-hardening-steps)
9. [Custom Security Checks](#custom-security-checks)
10. [Reporting and Alerting](#reporting-and-alerting)
11. [Custom Dashboard](#custom-dashboard)

## User and Group Audits

**Script:** `user_group_audit.sh`

This script audits all users and groups on the server, identifying potential security risks such as unused accounts or accounts with improper permissions.

**Usage:**

```bash
bash user_group_audit.sh
