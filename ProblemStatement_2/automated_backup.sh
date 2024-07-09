#!/bin/bash

# Configuration
backup_source="/path/to/your/source/directory"
remote_server="username@remote-server-ip:/path/to/remote/backup/directory"
log_file="/path/to/backup.log"

# Function to log messages
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

# Check if the source directory exists
if [ ! -d "$backup_source" ]; then
    log_message "Error: Source directory $backup_source not found."
    echo "Error: Source directory $backup_source not found."
    exit 1
fi

# Perform the backup using rsync
rsync -avz --delete "$backup_source" "$remote_server"

# Check the exit status of rsync
if [ $? -eq 0 ]; then
    log_message "Backup successful: $backup_source -> $remote_server"
    echo "Backup successful: $backup_source -> $remote_server"
else
    log_message "Backup failed: $backup_source -> $remote_server"
    echo "Backup failed: $backup_source -> $remote_server"
    exit 1
fi

# Exit with success status
exit 0
