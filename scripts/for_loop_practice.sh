#!/bin/bash
# Title:      For Loop Practice Script
# Author:     Irfan Sadiq
# Date:       2026-02-24
# Description: This script demonstrates the use of a for loop in Bash scripting to create multiple files in the current directory. It iterates through a list of file names and creates each file using the touch command, while also printing a success message for each created file.


Files="file1.sh file2.sh file3.sh"

for File in $Files
do
	touch $File
	echo "$File created successfully!"
done
