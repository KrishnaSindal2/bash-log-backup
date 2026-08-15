#!/bin/bash

# ====================================================================
# Project: Automated Log Backup Script
# Author: Krishna Sindal
# Description: Compresses and moves server logs to a backup directory.
# ====================================================================

# 1. रास्ता (Paths) तय करें
LOG_DIR="/var/log/app"        # जहाँ से लॉग्स उठाने हैं
BACKUP_DIR="/mnt/backup/logs" # जहाँ बैकअप सेव करना है
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="log_backup_$TIMESTAMP.tar.gz"

# 2. बैकअप डायरेक्टरी चेक करें, न हो तो बनाएं
if [ ! -d "$BACKUP_DIR" ]; then
    echo "[$(date)] Creating backup directory..."
    mkdir -p "$BACKUP_DIR"
fi

# 3. बैकअप की प्रक्रिया (Compression)
echo "[$(date)] Starting log backup..."
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$LOG_DIR" .

# 4. चेक करें कि बैकअप सफल हुआ या नहीं
if [ $? -eq 0 ]; then
    echo "[$(date)] Success: Backup created at $BACKUP_DIR/$BACKUP_NAME"
    
    # 5. पुराने बैकअप डिलीट करें (7 दिन से पुराने लॉग्स हटाना - Storage Management)
    find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;
    echo "[$(date)] Retention Policy: Cleaned up backups older than 7 days."
else
    echo "[$(date)] Error: Backup failed!" >&2
    exit 1
fi
