#!/bin/bash
# Title:      Check Website Reachable Sript
# Author:     Irfan Sadiq
# Date:       2026-02-28
# Description: This script checks if a specified website is reachable by pinging it. If the website is reachable, it will print a success message; otherwise, it will print a failure message. The website to check can be provided as a command-line argument, and if no argument is given, it defaults to "google.com".

#website="google.com"
website=${1:-google.com}

if ping -c 1 $website > /dev/null; then
	echo "Success: $website is reachable.."
else
	echo "Failure: $website is not reachable"
fi

