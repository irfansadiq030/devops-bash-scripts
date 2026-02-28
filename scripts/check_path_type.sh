#!/bin/bash
# Title:      Check Path Type Script
# Author:     Irfan Sadiq
# Date:       2026-02-28
# Description: This script checks if the provided path is a file, a directory, or neither. The user is prompted to enter a path, and the script uses conditional statements to determine the type of the path and prints the appropriate message.

#path=$1
read -p "Enter your path:" path

if [ -f "$path" ]; then
	echo "$path is a file"
elif [ -d "$path" ]; then
	echo "$path is a directory"
else
	echo "$path is neither a file or directory.."
fi

