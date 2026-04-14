#!/usr/bin/env bash

set -e

# ===== CONFIG =====
PHP_VERSION=${PHP_VERSION:-8.2}
NODE_VERSION=${NODE_VERSION:-lts}
INSTALL_MYSQL=${INSTALL_MYSQL:-true}
INSTALL_NODE=${INSTALL_NODE:-true}

echo "🚀 Setting up Laravel Dev Environment..."

# ===== UPDATE =====
sudo apt update -y

# ===== BASIC PACKAGES =====
sudo apt install -y curl unzip git software-properties-common

# ===== PHP =====
if ! command -v php >/dev/null; then
    echo "🐘 Installing PHP $PHP_VERSION..."

    sudo add-apt-repository ppa:ondrej/php -y
    sudo apt update

    sudo apt install -y \
        php$PHP_VERSION \
        php$PHP_VERSION-cli \
        php$PHP_VERSION-mbstring \
        php$PHP_VERSION-xml \
        php$PHP_VERSION-bcmath \
        php$PHP_VERSION-curl \
        php$PHP_VERSION-mysql \
        php$PHP_VERSION-zip
fi

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
COMPOSER_BIN=$(composer global config bin-dir --absolute)

grep -q "$COMPOSER_BIN" ~/.bashrc || echo "export PATH=\"$COMPOSER_BIN:\$PATH\"" >> ~/.bashrc

export PATH="$COMPOSER_BIN:$PATH"

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