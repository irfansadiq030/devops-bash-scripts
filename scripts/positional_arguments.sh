#!/bin/bash
# Title:      User Creation Script
# Author:     Irfan Sadiq
# Date:       2026-02-24
# Description: This script creates a new user on the system and sets a password for that user using positional arguments.

username=$1
password=$2

sudo useradd -m $username
echo $username:$password | sudo chpasswd
echo "User $username created successfully with a $password password.."

