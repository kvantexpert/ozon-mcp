#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-/tmp/ozon-server-backup}"
mkdir -p "$OUT"

cp /etc/systemd/system/ozon-mcp.service "$OUT/ozon-mcp.service"
cp /etc/nginx/sites-available/ozon-mcp "$OUT/ozon-mcp.nginx.conf"

{
    echo "=== OS ==="
    cat /etc/os-release
    echo
    echo "=== SYSTEMD ==="
    systemctl status ozon-mcp.service --no-pager 2>&1 || true
    echo
    echo "=== ENABLED ==="
    systemctl is-enabled ozon-mcp.service 2>&1 || true
    echo
    echo "=== UV ==="
    /root/.local/bin/uv --version 2>&1 || true
    echo
    echo "=== UVX ==="
    /root/.local/bin/uvx --version 2>&1 || true
    echo
    echo "=== NGINX CONFIG TEST ==="
    nginx -t 2>&1 || true
    echo
    echo "=== LISTENING PORTS ==="
    ss -lntp 2>&1 || true
    echo
    echo "=== CREDENTIAL FILE PERMISSIONS ==="
    ls -l /root/.config/ozon-mcp/env 2>&1 || true
    echo
    echo "=== CREDENTIAL NAMES ONLY ==="
    grep -E '^(OZON_CLIENT_ID|OZON_API_KEY)=' /root/.config/ozon-mcp/env 2>/dev/null | sed 's/=.*$/=<SECRET>/' || true
} > "$OUT/SERVER_STATE.txt"

chmod 600 "$OUT"/*.txt "$OUT"/*.service "$OUT"/*.conf
echo "Backup metadata/config saved to $OUT"
