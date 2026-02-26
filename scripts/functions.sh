#!/bin/bash
# Title:      Service Check Script & Function Demonstration
# Author:     Irfan Sadiq
# Date:       2026-02-26
# Description: This script defines a function to check the status of a service and demonstrates its usage by checking the status of two common web server services: Apache2 and Nginx.


check_service() {
	if systemctl is-active --quiet $1; then
		echo "Service $1 is running.."
	else
		echo "Service $1 is not running.."
	fi
}

check_service appache2
check_service nginx
