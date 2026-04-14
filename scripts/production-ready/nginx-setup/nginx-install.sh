#!/usr/bin/env bash

set -e

echo "🌐 Installing Nginx..."

if ! command -v nginx >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y nginx
fi

sudo systemctl enable nginx
sudo systemctl start nginx

echo "✅ Nginx installed & running"