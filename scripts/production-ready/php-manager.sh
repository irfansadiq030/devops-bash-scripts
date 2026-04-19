#!/usr/bin/env bash

set -e

AVAILABLE_VERSIONS=("8.1" "8.2" "8.3" "8.4")

echo "🐘 PHP Version Manager"
echo "======================="
echo ""

# Show installed PHP versions
echo "📦 Installed PHP versions:"
ls /usr/bin/php* 2>/dev/null | grep -oP 'php\K[0-9.]+' || echo "No multiple versions detected"
echo ""

# Show available versions
echo "📌 Available versions:"
for i in "${!AVAILABLE_VERSIONS[@]}"; do
    echo "  $((i+1))) PHP ${AVAILABLE_VERSIONS[$i]}"
done

echo ""
read -p "👉 Select PHP version to use: " choice

PHP_VERSION="${AVAILABLE_VERSIONS[$((choice-1))]}"

if [[ -z "$PHP_VERSION" ]]; then
    echo "❌ Invalid selection"
    exit 1
fi

echo ""
echo "🔍 Checking PHP $PHP_VERSION..."

# Check if installed
if ! command -v php$PHP_VERSION >/dev/null 2>&1; then
    echo "⚠️ PHP $PHP_VERSION not found. Installing..."

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
        php$PHP_VERSION-zip \
        php$PHP_VERSION-gd \
        php$PHP_VERSION-fpm 
else
    echo "✔ PHP $PHP_VERSION already installed"
fi

echo ""
echo "🔄 Switching PHP version..."

sudo update-alternatives --set php /usr/bin/php$PHP_VERSION

echo ""
echo "✔ Active PHP version:"
php -v