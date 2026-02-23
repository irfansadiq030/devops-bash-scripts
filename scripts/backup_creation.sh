#!/bin/bash
# Title:      Backup Creation Script
# Author:     Irfan Sadiq
# Date:       2026-02-24
# Description: This script creates a backup of important data from a source directory to a backup directory. It also demonstrates the use of variables and basic file operations in Bash scripting.


SOURCE_DIR="/home/irfan/important_data"
BACKUP_DIR="/home/irfan/backup_directory"

mkdir -p $BACKUP_DIR
mkdir -p $SOURCE_DIR	

echo "File 1 has been created.." > $SOURCE_DIR/file1.txt
echo "File 2 has been created.." > $SOURCE_DIR/dile2.txt


cp -r $SOURCE_DIR/* $BACKUP_DIR
echo "Backup Completed successfully!"
