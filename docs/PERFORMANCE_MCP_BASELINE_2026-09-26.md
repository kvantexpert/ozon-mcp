# Performance MCP — контрольная точка 2026-09-26

## Назначение

Этот документ фиксирует состояние проекта **после миграции на pinned patched runtime и полного live-аудита каталога**.

Это контрольная точка для дальнейшей разработки. Seller MCP должен оставаться независимым.

## Текущий статус

**LIVE / DEPLOYED / 48-OPERATION CATALOG AUDITED**

VPS:

`cv7976275`

Performance service:

`ozon-performance.service`

Backend:

`127.0.0.1:8001`

Seller backend:

`127.0.0.1:8000`

Performance публично не опубликован.

## Архитектура

```
                    VPS cv7976275
                         |
             +-----------+-----------+
             |                       |
       Seller MCP              Performance MCP
       :8000                   :8001 loopback
             |                       |
       Ozon Seller API        OAuth -> Ozon Performance API
```

Seller и Performance используют отдельные сервисы и credentials.

## Runtime

Performance:

- package: `marketplaces-mcp-ru 0.6.1`
- upstream commit: `ec2114595695536e001e09e1144a357118852db1`
- runtime: `/opt/kvantexpert/marketplaces-mcp-ru/.venv/bin/ozon-perf-mcp`
- catalog: tracked patched `perf_endpoints.yaml`
- catalog count: **48**

Seller:

- package: `ozon-mcp-ru 0.6.0`
- backend: `127.0.0.1:8000`
- public endpoint: `https://ozon-mcp.kvantexpert.ru/mcp`

## Credentials

Performance:

`/root/.config/ozon-mcp/perf.env`

Variables:

- `OZON_PERF_CLIENT_ID`
- `OZON_PERF_CLIENT_SECRET`

Permissions:

`600 root:root`

Secrets are never committed.

## API catalog

Current upstream OpenAPI source contains 48 operations.

Tracked patch contains 48 operations.

The patch adds:

1. `POST /api/client/statistics/products/sku`
2. `PATCH /api/client/campaign/{campaignId}`
3. `GET /api/client/campaign/all_sku_promo/set_bid`

Safety corrections include semantic classification of POST read methods and GET mutators.

## Live audit result

26.09.2026:

**48/48 operation_id successfully returned from the running MCP; 0 FAIL.**

Verified directly in the running process:

- new statistics/products/sku → `read`;
- PATCH campaign → `write`;
- all-SKU set-bid GET → `write`;
- min SKU POST → `read`;
- recommended bids POST → `read`;
- all-SKU activate/deactivate GET → `write`.

The audit uses `ozon_perf_describe_method`, so it validates catalog loading and dispatcher visibility. It does not execute write operations.

## End-to-end API state

Before the pinned migration, OAuth and a harmless `GET /api/client/campaign` were successfully tested end-to-end and returned HTTP 200 with an empty campaign list.

The post-migration 48/48 audit is complete. A fresh post-migration data read is intentionally tracked as the next smoke-test so that deployment validation remains distinguishable from catalog validation.

## Safety model

The runtime exposes generic dispatcher tools rather than one MCP tool per API operation:

- `ozon_perf_call_method` — read;
- `ozon_perf_write_method` — write with confirmation;
- `ozon_perf_delete_method` — destructive with additional confirmation;
- raw write/delete tools — separately protected.

Do not interpret 48 operation_id as 48 independent MCP tools.

## What is intentionally not done

- Performance :8001 is not exposed through nginx.
- Seller MCP is not modified.
- Performance credentials are not stored in GitHub.
- Write/destructive operations have not been treated as safe merely because their operation_id exists.
- No decision has been made yet about the external AI-visible Performance tool set.

## Next development steps

1. Post-migration harmless read smoke-test.
2. Test key READ methods and document results.
3. Define minimal AI-visible Performance tool set.
4. Test WRITE methods with confirmation and verification.
5. Design external access/authentication for Performance MCP.
6. Only then consider nginx/public exposure.

## Repository source of truth

- API contract: `docs/PERFORMANCE_API_MATRIX_2026-09-26.md`
- Catalog patch: `patches/marketplaces-mcp-ru/perf_endpoints.yaml`
- Automated tests: `tests/test_performance_catalog_patch.py`
- Installer: `deploy/scripts/install-performance-mcp.sh`
- Systemd: `deploy/systemd/ozon-performance.service`
- Runtime state: `server/PERFORMANCE_RUNTIME.md`
- VPS state: `server/SERVER_STATE.md`
