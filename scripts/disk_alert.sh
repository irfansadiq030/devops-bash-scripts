#!/bin/bash
# Title:      Disk Usage Alert Script
# Author:     Irfan Sadiq
# Date:       2026-02-28
# Description: This script checks the disk usage of the root partition and alerts if it exceeds a specified threshold.

threshold=80

usage=$(df -h / | grep / | awk '{print $5}' | sed s'/%//g')

if [ $usage -gt $threshold ] 
then
	echo "Alert: Disk Usage is above $threshold% - currently at $usage"
else
	echo "Disk Usage is normal: $usage"
fi

