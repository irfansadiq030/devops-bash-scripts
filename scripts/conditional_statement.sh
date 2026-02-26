#!/bin/bash
# Title:      Conditional Statement Script
# Author:     Irfan Sadiq
# Date:       2026-02-26
# Description: This script demonstrates conditional statements in Bash. It checks disk usage and provides appropriate messages based on the usage level.

# DISK_USAGE=50
read -p "Enter the current disk usage percentage: " DISK_USAGE

if [ $DISK_USAGE -lt 80 ]; then
	echo "Disk Usage is Normal and it is less than 80%"

elif [ $DISK_USAGE -eq 80 ]; then
	echo "Get ready! Usage is at $DISK_USAGE"

else
	echo "ALERT: Disk Usage is $DISK_USAGE%, which is dangerous!"
fi
