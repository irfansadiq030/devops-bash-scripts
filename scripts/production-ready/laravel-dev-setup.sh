#!/usr/bin/env bash

set -e

# ===== CONFIG =====
PHP_VERSION=${PHP_VERSION:-8.3}
NODE_VERSION=${NODE_VERSION:-lts}
INSTALL_MYSQL=${INSTALL_MYSQL:-true}
INSTALL_NODE=${INSTALL_NODE:-true}

echo "🚀 Setting up Laravel Dev Environment..."

# ===== UPDATE =====
sudo apt update -y

# ===== BASIC PACKAGES =====
echo "📦 Installing basic dependencies..."
sudo apt install -y curl unzip git software-properties-common

# ===== PHP =====
if ! command -v php >/dev/null; then
    echo "❌ PHP is not installed. Please run your PHP setup script first."
    exit 1
fi

echo "🐘 Using PHP version:"
php -v

# ===== COMPOSER =====
if ! command -v composer >/dev/null; then
    echo "🎼 Installing Composer..."

    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php --quiet
    sudo mv composer.phar /usr/local/bin/composer
    rm composer-setup.php
fi

# ===== MYSQL =====
if [ "$INSTALL_MYSQL" = true ] && ! command -v mysql >/dev/null; then
    echo "🛢 Installing MySQL..."
    sudo apt install -y mysql-server
fi

# ===== NODE =====
if [ "$INSTALL_NODE" = true ] && ! command -v node >/dev/null; then
    echo "🟢 Installing Node..."

    if [ "$NODE_VERSION" = "lts" ]; then
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    else
        curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo -E bash -
    fi

    sudo apt install -y nodejs
fi

# ===== LARAVEL =====
echo "⚡ Installing Laravel..."
composer global require laravel/installer

# ===== PATH =====
echo "🔗 Setting PATH..."

COMPOSER_BIN_DIR=$(composer global config bin-dir --absolute 2>/dev/null || true)

if [[ -z "$COMPOSER_BIN_DIR" ]]; then
    if [[ -d "$HOME/.config/composer/vendor/bin" ]]; then
        COMPOSER_BIN_DIR="$HOME/.config/composer/vendor/bin"
    else
        COMPOSER_BIN_DIR="$HOME/.composer/vendor/bin"
    fi
fi

if ! grep -q "$COMPOSER_BIN_DIR" "$HOME/.bashrc"; then
    echo "export PATH=\"$COMPOSER_BIN_DIR:\$PATH\"" >> "$HOME/.bashrc"
fi

export PATH="$COMPOSER_BIN_DIR:$PATH"
source "$HOME/.bashrc" >/dev/null 2>&1 || true

if command -v laravel >/dev/null 2>&1; then
    laravel --version
else
    echo "❌ Laravel not found in PATH. Restart terminal or run: source ~/.bashrc"
fi

# Verify Laravel
if command -v laravel >/dev/null 2>&1; then
    laravel --version
else
    echo "❌ Laravel not found in PATH. Try restarting terminal."
fi

# ===== VERIFY =====
if command -v laravel >/dev/null; then
    laravel --version
else
    echo "⚠️ Restart terminal or run: source ~/.bashrc"
fi

echo "✅ Setup Complete!"
echo "PHP version: $(php -v)"
echo "Laravel Installer version: $(laravel --version)"
echo "MySQL version: $(mysql --version)"
echo "Node version: $(node --version)"
echo "Composer version: $(composer --version)"