# Ozon Performance MCP — implementation record 2026-09-26

## Goal

Move from the audited 45-operation Performance catalog to the current 48-operation OpenAPI surface without changing Seller MCP.

## Execution order

1. **Audit upstream/runtime** — completed.
   - Runtime source is marketplaces-mcp-ru 0.6.1 at commit ec2114595695536e001e09e1144a357118852db1.
   - ozon_perf_mcp/server.py loads ozon_mcp/perf_endpoints.yaml through Catalog.from_yaml.
   - Generic call_method / write_method / delete_method consume the catalog; no separate 48 Python tools are required.
   - OAuth/client code is already live-tested and is not changed.

2. **Correct safety classification** — completed in the patch.
   - POST /api/client/min/sku: write → read.
   - POST /api/client/search_promo/bids/recommendation: write → read.
   - GET /api/client/campaign/all_sku_promo/activate: read → write.
   - GET /api/client/campaign/all_sku_promo/deactivate: read → write.
   - GET /api/client/campaign/all_sku_promo/set_bid: added as write.

3. **Add missing operations** — completed in the patch.
   - POST /api/client/statistics/products/sku — read.
   - PATCH /api/client/campaign/{campaignId} — write.
   - GET /api/client/campaign/all_sku_promo/set_bid — write.

4. **Build/deployment mechanism** — completed in repository.
   - patches/marketplaces-mcp-ru/perf_endpoints.yaml contains the complete 48-operation catalog.
   - deploy/scripts/install-performance-mcp.sh pins the upstream commit, applies the audited catalog, and installs a local virtualenv.
   - This avoids modifying the Seller MCP and avoids an unpinned uvx --from production dependency.

5. **Automated validation** — completed in repository.
   - tests/test_performance_catalog_patch.py checks 48 operations, the 3 additions, and all safety corrections.

6. **Live VPS rollout** — intentionally pending until the repository changes are reviewed/tested.
   - Current production Performance MCP remains on 127.0.0.1:8001.
   - Seller MCP remains on 127.0.0.1:8000.
   - Credentials remain in /root/.config/ozon-mcp/perf.env.
   - No public Performance route is added by this change.

## Files changed by this implementation

- patches/marketplaces-mcp-ru/perf_endpoints.yaml
- tests/test_performance_catalog_patch.py
- deploy/scripts/install-performance-mcp.sh
- deploy/systemd/ozon-performance.service
- this document

## Source of truth

The complete API request schemas remain documented in docs/PERFORMANCE_API_MATRIX_2026-09-26.md. The runtime catalog intentionally contains endpoint metadata rather than duplicating OpenAPI request schemas.

## Rollback

Rollback means restoring the previous marketplaces-mcp-ru 0.6.1 deployment and its original 45-operation perf_endpoints.yaml. Seller MCP is independent and is not part of this rollout.
