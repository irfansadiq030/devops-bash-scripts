#!/bin/bash
# Title:      User Creation Script
# Author:     Irfan Sadiq
# Date:       2026-02-24
# Description: This script creates a new user on the system and sets a password for that user.

read -p "Enter Username:" username
sudo useradd -m $username

echo "Enter password for new User"

#set password
sudo passwd $username
