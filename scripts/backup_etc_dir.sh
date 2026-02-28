#!/bin/bash
# Title:      Backup /etc Directory Script
# Author:     Irfan Sadiq
# Date:       2026-02-28
# Description: This script creates a compressed backup of the /etc directory.

Filename="etc-bkp-$(date +%F).tar.gz"
Backup_dir="/home/irfan/backup"

mkdir -p $Backup_dir

tar -czf $Backup_dir/$Filename /etc

echo "Backup Completed: $Backup_dir/$Filename"


