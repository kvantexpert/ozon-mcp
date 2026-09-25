# Performance MCP — VPS runtime

## Текущее состояние

Дата фиксации: **2026-09-26**

Хост: `cv7976275`

Статус: **LIVE / migrated / audited**

На VPS работает отдельный Performance MCP на базе pinned upstream `marketplaces-mcp-ru 0.6.1` с локально применённым audited 48-operation catalog patch.

## Systemd

Сервис:

`ozon-performance.service`

Запуск:

```
/opt/kvantexpert/marketplaces-mcp-ru/.venv/bin/ozon-perf-mcp
```

Unit:

`deploy/systemd/ozon-performance.service`

Пользователь:

`root`

Рабочий каталог:

`/opt/kvantexpert/marketplaces-mcp-ru`

Environment:

`/root/.config/ozon-mcp/perf.env`

Автозапуск:

`enabled`

Состояние:

`active/running`

## Network

Performance MCP:

`127.0.0.1:8001`

Транспорт:

`Streamable HTTP`

Публичного nginx route для Performance MCP **нет**.

Порт 8001 намеренно остается loopback-only.

Публичный Seller MCP продолжает работать отдельно:

`https://ozon-mcp.kvantexpert.ru/mcp`

## Package source

Performance:

- package: `marketplaces-mcp-ru 0.6.1`
- upstream repository: `https://github.com/ilyautov/marketplaces-mcp-ru.git`
- pinned upstream commit: `ec2114595695536e001e09e1144a357118852db1`

Runtime устанавливается reproducibly через:

`deploy/scripts/install-performance-mcp.sh`

Скрипт:

1. checkout'ит pinned upstream commit;
2. заменяет только `ozon_mcp/perf_endpoints.yaml` на tracked audited catalog;
3. создает локальный Python venv;
4. устанавливает `marketplaces-mcp-ru 0.6.1`;
5. оставляет Seller MCP :8000 нетронутым.

Seller production:

- package: `ozon-mcp-ru 0.6.0`
- backend: `127.0.0.1:8000`

Seller и Performance не объединяются в один runtime.

## Performance catalog

Tracked catalog:

`patches/marketplaces-mcp-ru/perf_endpoints.yaml`

Количество:

**48 endpoints / operation_id**

Runtime catalog после миграции также содержит **48 операций**.

Полная матрица:

`docs/PERFORMANCE_API_MATRIX_2026-09-26.md`

Автотест:

`tests/test_performance_catalog_patch.py`

Проверяются:

- количество 48;
- уникальность operation_id;
- 3 новые операции;
- safety corrections;
- отсутствие GET-мутаторов с safety=read.

## Live audit

26.09.2026 выполнен live-аудит через MCP `ozon_perf_describe_method`.

Результат:

**48/48 operation_id найдены; 0 FAIL.**

Проверены в том числе новые операции:

- `POST /api/client/statistics/products/sku` → `read`;
- `PATCH /api/client/campaign/{campaignId}` → `write`;
- `GET /api/client/campaign/all_sku_promo/set_bid` → `write`.

Также подтверждены исправления:

- `POST /api/client/min/sku` → `read`;
- `POST /api/client/search_promo/bids/recommendation` → `read`;
- GET activate/deactivate all SKU promo → `write`.

Этот аудит подтверждает загрузку patched catalog в работающий runtime. Он не заменяет отдельную проверку фактических write-операций.

## Credentials

Файл:

`/root/.config/ozon-mcp/perf.env`

Ожидаемые переменные:

```
OZON_PERF_CLIENT_ID=<secret>
OZON_PERF_CLIENT_SECRET=<secret>
MCP_TRANSPORT=http
MCP_HTTP_HOST=127.0.0.1
MCP_HTTP_PORT=8001
```

Права:

`600 root:root`

Реальные secret values в GitHub и документацию не записываются.

## Подтвержденные проверки

Подтверждены:

- OAuth client_credentials;
- получение Bearer token;
- прямой Performance API request;
- MCP initialize;
- MCP tools/list;
- MCP tools/call;
- `ozon_perf_describe_method`;
- live catalog audit 48/48.

Ранее end-to-end read test для `GET /api/client/campaign` дал HTTP 200 с:

```json
{
  "list": [],
  "total": "0"
}
```

После миграции на pinned patched build каталог и MCP flow проверены отдельно. Новый live data read после миграции следует считать отдельным smoke-test, а не смешивать его с 48/48 catalog audit.

## Safety model

Generic MCP tools остаются:

- `ozon_perf_call_method` — read;
- `ozon_perf_write_method` — write, требует подтверждения;
- `ozon_perf_delete_method` — destructive, требует дополнительных подтверждений;
- raw write/delete также защищены.

**48 operation_id не означают 48 отдельных MCP tools.** Runtime использует generic dispatcher по `operation_id`.

## Recovery

Для повторного deployment:

1. checkout repository;
2. запустить `deploy/scripts/install-performance-mcp.sh`;
3. установить `deploy/systemd/ozon-performance.service`;
4. создать `/root/.config/ozon-mcp/perf.env` непосредственно на VPS;
5. `systemctl daemon-reload`;
6. `systemctl enable --now ozon-performance`;
7. проверить `:8001/mcp`;
8. выполнить MCP initialize/tools/list;
9. выполнить 48/48 describe audit;
10. отдельно выполнить безопасный read smoke-test.

Seller MCP при этом не изменяется.

## Следующий этап

1. Выполнить post-migration read smoke-test через `ozon_perf_call_method`.
2. Проверить необходимые READ методы Performance API.
3. Определить минимальный набор инструментов для AI-клиента.
4. Отдельно тестировать WRITE операции с подтверждением.
5. Только после этого проектировать внешний доступ к Performance MCP.

До отдельного решения Performance MCP остается loopback-only.
