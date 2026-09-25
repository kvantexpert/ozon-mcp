#!/usr/bin/env bash
set -euo pipefail

# Reproducible Performance MCP build from a pinned upstream commit plus the
# repository's catalog patch. Does not touch Seller MCP :8000.

REPO_URL="https://github.com/ilyautov/marketplaces-mcp-ru.git"
UPSTREAM_COMMIT="ec2114595695536e001e09e1144a357118852db1"
INSTALL_ROOT="/opt/kvantexpert/marketplaces-mcp-ru"
PATCH_URL="https://raw.githubusercontent.com/kvantexpert/ozon-mcp/main/patches/marketplaces-mcp-ru/perf_endpoints.yaml"

install -d -m 0755 /opt/kvantexpert
if [[ ! -d "$INSTALL_ROOT/.git" ]]; then
  git clone "$REPO_URL" "$INSTALL_ROOT"
fi
cd "$INSTALL_ROOT"
git fetch --depth 1 origin "$UPSTREAM_COMMIT"
git reset --hard "$UPSTREAM_COMMIT"

curl -fsSL "$PATCH_URL" -o "$INSTALL_ROOT/ozon_mcp/perf_endpoints.yaml"

uv venv --python 3.11 "$INSTALL_ROOT/.venv"
uv pip install --python "$INSTALL_ROOT/.venv/bin/python" --upgrade pip
uv pip install --python "$INSTALL_ROOT/.venv/bin/python" "$INSTALL_ROOT"

printf 'Installed upstream commit: %s
' "$UPSTREAM_COMMIT"
printf 'Performance catalog operations: '
grep -c '^[-] operation_id:' "$INSTALL_ROOT/ozon_mcp/perf_endpoints.yaml"
