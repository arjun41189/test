#!/bin/bash

# Define threshold values
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
PROC_THRESHOLD=80

# Define the log file
LOG_FILE="/var/log/system_health.log"

# Function to check disk usage
check_disk_usage()
{
          DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
            if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
                        echo "$(date): Disk usage is above threshold: ${DISK_USAGE}%" >> $LOG_FILE
                          fi
}

# Function to check CPU usage
check_cpu_usage() {
          CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
            if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
                        echo "$(date): CPU usage is above threshold: ${CPU_USAGE}%" >> $LOG_FILE
                          fi
                  }

# Function to check memory usage
check_memory_usage() {
          MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
            if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
                        echo "$(date): Memory usage is above threshold: ${MEM_USAGE}%" >> $LOG_FILE
                          fi
                  }
# Function to check running processes
check_running_processes() {
          RUNNING_PROCESSES=$(ps aux | wc -l)
            if [ "$RUNNING_PROCESSES" -gt "$PROC_THRESHOLD" ]; then
                        echo "$(date): Number of running processes is above threshold: ${RUNNING_PROCESSES}" >> $LOG_FILE
                          fi
                  }

check_system_health()
{
          check_cpu_usage
          check_memory_usage
          check_disk_usage
          check_running_processes
}
# Run the health check
check_system_health

# Schedule the script to run every 5 minutes using cron
# (crontab -e to add the following line)
# */5 * * * * /path/to/this_script.sh