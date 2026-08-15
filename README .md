# Automated Log Backup Script using Bash & Cron

## 📌 Project Overview
This project features a production-ready **Bash script** designed to automate server log management. It compresses log files into a `.tar.gz` archive, moves them to a secure backup directory, and implements a retention policy to delete logs older than 7 days, preventing disk space issues.

## 🚀 Features
- **Automation:** Fully automated server maintenance without human intervention.
- **Storage Optimization:** Compresses log files to save up to 70% storage space.
- **Retention Policy:** Automatically purges backups older than 7 days.
- **Error Handling:** Validates directory existence and logs status messages.

## ⏰ Cron Job Setup (Scheduling)
To run this script automatically every day at midnight (00:00), add the following line to your Linux crontab:
```bash
0 0 * * * /bin/bash /path/to/backup_script.sh >> /var/log/backup_cron.log 2>&1
```
