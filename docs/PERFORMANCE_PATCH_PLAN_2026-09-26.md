# Ozon Performance MCP — implementation record 2026-09-26

## Goal

Перевести Performance MCP с исходного 45-operation catalog на актуальный 48-operation OpenAPI surface, не меняя Seller MCP.

## Status

**COMPLETED: repository patch + production migration + live 48/48 catalog audit.**

## Execution order

1. **Audit upstream/runtime** — completed.
   - Runtime source: `marketplaces-mcp-ru 0.6.1`.
   - Pinned upstream commit: `ec2114595695536e001e09e1144a357118852db1`.
   - `ozon_perf_mcp/server.py` loads `ozon_mcp/perf_endpoints.yaml`.
   - Generic `call_method / write_method / delete_method` consume the catalog.
   - 48 operation_id are not 48 separate MCP tools.

2. **Correct safety classification** — completed.
   - `POST /api/client/min/sku`: read.
   - `POST /api/client/search_promo/bids/recommendation`: read.
   - `GET /api/client/campaign/all_sku_promo/activate`: write.
   - `GET /api/client/campaign/all_sku_promo/deactivate`: write.
   - `GET /api/client/campaign/all_sku_promo/set_bid`: write.

3. **Add missing operations** — completed.
   - `POST /api/client/statistics/products/sku` — read.
   - `PATCH /api/client/campaign/{campaignId}` — write.
   - `GET /api/client/campaign/all_sku_promo/set_bid` — write.

4. **Build/deployment mechanism** — completed.
   - `patches/marketplaces-mcp-ru/perf_endpoints.yaml` contains 48 operations.
   - `deploy/scripts/install-performance-mcp.sh` pins upstream and applies the tracked catalog.
   - Runtime is installed in `/opt/kvantexpert/marketplaces-mcp-ru/.venv`.
   - `deploy/systemd/ozon-performance.service` points to the pinned local runtime.
   - Seller MCP :8000 remains untouched.

5. **Automated validation** — completed.
   - `tests/test_performance_catalog_patch.py` locks the 48-operation count, additions and safety corrections.

6. **Live VPS rollout** — completed.
   - Performance service is active/running on `127.0.0.1:8001`.
   - Performance credentials remain in `/root/.config/ozon-mcp/perf.env`.
   - No public Performance route was added.
   - Seller MCP remains on `127.0.0.1:8000).

7. **Live catalog audit** — completed.
   - `ozon_perf_describe_method` was called for all 48 operation_id.
   - Result: **48/48 found, 0 FAIL**.
   - New operations and corrected safety classifications were verified in the running process.

## Files changed by this implementation

- `patches/marketplaces-mcp-ru/perf_endpoints.yaml`
- `tests/test_performance_catalog_patch.py`
- `deploy/scripts/install-performance-mcp.sh`
- `deploy/systemd/ozon-performance.service`
- `docs/PERFORMANCE_PATCH_PLAN_2026-09-26.md`
- `server/PERFORMANCE_RUNTIME.md`
- `server/SERVER_STATE.md`
- `docs/PERFORMANCE_API_MATRIX_2026-09-26.md`
- `docs/PERFORMANCE_MCP_BASELINE_2026-09-26.md`

## Source of truth

- API contract: `docs/PERFORMANCE_API_MATRIX_2026-09-26.md`
- Runtime catalog patch: `patches/marketplaces-mcp-ru/perf_endpoints.yaml`
- Deployment: `deploy/scripts/install-performance-mcp.sh` + `deploy/systemd/ozon-performance.service`
- VPS state: `server/PERFORMANCE_RUNTIME.md` + `server/SERVER_STATE.md`

## Rollback

Rollback means restoring the previous 45-operation `perf_endpoints.yaml` and previous Performance runtime deployment.

Seller MCP is independent and is not part of this rollout.

## Next step

Run one post-migration harmless read smoke-test:

`ozon_perf_call_method(operation_id=ozonperf_get_api_client_campaign)`

Then continue with read API coverage and the design of the minimal AI-visible tool set. Do not publish Performance MCP externally before the access-control design is completed.
