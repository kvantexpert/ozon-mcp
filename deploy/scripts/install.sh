#!/usr/bin/env bash
set -euo pipefail

DOMAIN="${1:-ozon-mcp.kvantexpert.ru}"
REPO_DIR="${2:-/root/ozon-mcp}"

apt-get update
apt-get install -y nginx certbot python3-certbot-nginx curl ca-certificates

if ! command -v uv >/dev/null 2>&1; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

export PATH="/root/.local/bin:$PATH"
install -d -m 700 /root/.config/ozon-mcp

if [[ ! -f /root/.config/ozon-mcp/env ]]; then
    install -m 600 "$REPO_DIR/deploy/env/ozon-mcp.env.example" /root/.config/ozon-mcp/env
    echo "Создан /root/.config/ozon-mcp/env. Заполните OZON_CLIENT_ID и OZON_API_KEY."
fi

install -m 644 "$REPO_DIR/deploy/systemd/ozon-mcp.service" /etc/systemd/system/ozon-mcp.service
install -m 644 "$REPO_DIR/deploy/nginx/ozon-mcp.conf" /etc/nginx/sites-available/ozon-mcp
ln -sfn /etc/nginx/sites-available/ozon-mcp /etc/nginx/sites-enabled/ozon-mcp

nginx -t
systemctl daemon-reload
systemctl enable ozon-mcp.service

echo
echo "Базовая установка готова."
echo "1. Заполните /root/.config/ozon-mcp/env"
echo "2. Запустите: systemctl restart ozon-mcp.service"
echo "3. Получите SSL: certbot --nginx -d $DOMAIN"
