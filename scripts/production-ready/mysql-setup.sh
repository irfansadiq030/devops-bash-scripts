#!/usr/bin/env bash

set -e

echo "🛢️ Setting up MySQL..."

# ===== INSTALL =====
if ! command -v mysql >/dev/null 2>&1; then
    echo "📦 Installing MySQL..."
    sudo apt update
    sudo apt install -y mysql-server
fi

# ===== START SERVICE =====
echo "🚀 Starting MySQL service..."
sudo systemctl enable mysql
sudo systemctl start mysql

# ===== SECURE INSTALL (manual step) =====
echo ""
echo "⚠️ IMPORTANT: Run this manually if first time:"
echo "👉 sudo mysql_secure_installation"
echo ""

# ===== CREATE DEV DB + USER =====
read -p "👉 Create dev database name (default: laravel): " DB_NAME
DB_NAME=${DB_NAME:-laravel}

read -p "👉 Create DB user (default: dev): " DB_USER
DB_USER=${DB_USER:-dev}

read -s -p "👉 Enter password for $DB_USER: " DB_PASS
echo ""

echo "🧱 Setting up database..."

sudo mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

sudo mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"

sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost';"

sudo mysql -e "FLUSH PRIVILEGES;"

echo "✅ MySQL setup completed!"
echo ""
echo "📌 Database: $DB_NAME"
echo "📌 User: $DB_USER"
echo ""
echo "🧪 Test connection:"
echo "mysql -u $DB_USER -p"