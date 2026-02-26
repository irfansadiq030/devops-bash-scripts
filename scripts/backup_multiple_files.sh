#!/bin/bash
# Title:      Backup Multiple Files Script
# Author:     Irfan Sadiq
# Date:       2026-02-26
# Description: This script creates multiple files and backs them up to a specified directory.

FILES="file1.txt file2.txt file3.txt"
BACKUP_DIR="backup"

mkdir -p $BACKUP_DIR

for FILE in $FILES
do
	touch $FILE
	cp -r $FILE $BACKUP_DIR
	echo "$FILE backed up to $BACKUP_DIR"
done
echo "All files have been backed up successfully!"
