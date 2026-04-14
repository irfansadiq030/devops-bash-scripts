#!/usr/bin/env bash

set -e

PROJECT_NAME=$1

if [[ -z "$PROJECT_NAME" ]]; then
    echo "❌ Usage: nginx-add <project-name>"
    exit 1
fi

PROJECT_PATH="$HOME/projects/$PROJECT_NAME/public"
CONF="/etc/nginx/sites-available/$PROJECT_NAME"

echo "🌐 Adding project to Nginx: $PROJECT_NAME"

if [[ ! -d "$PROJECT_PATH" ]]; then
    echo "❌ Project not found: $PROJECT_PATH"
    exit 1
fi

sudo bash -c "cat > $CONF" <<EOL
server {
    listen 80;
    server_name $PROJECT_NAME.local;

    root $PROJECT_PATH;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php-fpm.sock;
    }
}
EOL

sudo ln -sf $CONF /etc/nginx/sites-enabled/

sudo nginx -t
sudo systemctl reload nginx

echo "✅ Project added: http://$PROJECT_NAME.local"