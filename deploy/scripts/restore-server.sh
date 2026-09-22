#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${1:-/root/ozon-mcp}"
DOMAIN="${2:-ozon-mcp.kvantexpert.ru}"

if [[ ! -f /root/.config/ozon-mcp/env ]]; then
    echo "ERROR: /root/.config/ozon-mcp/env not found."
    echo "Create it from deploy/env/ozon-mcp.env.example and set real Ozon credentials."
    exit 1
fi

chmod 600 /root/.config/ozon-mcp/env
install -m 644 "$REPO_DIR/deploy/systemd/ozon-mcp.service" /etc/systemd/system/ozon-mcp.service
install -m 644 "$REPO_DIR/deploy/nginx/ozon-mcp.conf" /etc/nginx/sites-available/ozon-mcp
ln -sfn /etc/nginx/sites-available/ozon-mcp /etc/nginx/sites-enabled/ozon-mcp

nginx -t
systemctl daemon-reload
systemctl enable ozon-mcp.service
systemctl restart ozon-mcp.service

if ! command -v certbot >/dev/null 2>&1; then
    echo "WARNING: certbot is not installed. Install certbot before enabling HTTPS."
else
    echo
    echo "HTTPS can be enabled with:"
    echo "  certbot --nginx -d $DOMAIN"
fi

echo
echo "Restore completed."
echo "Check:"
echo "  systemctl status ozon-mcp.service --no-pager"
echo "  nginx -t"
