# Performance MCP — VPS runtime

## Текущее состояние

Дата фиксации: 2026-09-26

Хост: `cv7976275`

## Systemd

Сервис:

`ozon-performance.service`

Запуск:

```
/root/.local/bin/uvx --from marketplaces-mcp-ru ozon-perf-mcp
```

Конфигурация:

`/root/.config/ozon-mcp/perf.env`

Пользователь:

`root`

Рабочий каталог:

`/root`

Автозапуск:

`enabled`

Состояние на момент фиксации:

`active/running`

## Network

Performance MCP:

`127.0.0.1:8001`

Транспорт:

`Streamable HTTP`

Публичного nginx route для Performance MCP пока нет.

Это сделано намеренно: текущий HTTP transport не должен быть выставлен непосредственно в Интернет без отдельного механизма защиты.

## Seller MCP

Существующий сервис не изменен:

`ozon-mcp.service`

Backend:

`127.0.0.1:8000`

Public endpoint:

`https://ozon-mcp.kvantexpert.ru/mcp`

## Package source

Performance запускается из:

`marketplaces-mcp-ru 0.6.1`

Upstream commit:

`ec2114595695536e001e09e1144a357118852db1`

Seller production:

`ozon-mcp-ru 0.6.0`

Таким образом, Seller и Performance сейчас используют разные entrypoint/package paths. Это зафиксировано и не должно считаться ошибкой до отдельного решения о выравнивании deployment.

## Credentials

`/root/.config/ozon-mcp/perf.env`

Ожидаемые переменные:

```
OZON_PERF_CLIENT_ID=<secret>
OZON_PERF_CLIENT_SECRET=<secret>
MCP_TRANSPORT=http
MCP_HTTP_HOST=127.0.0.1
MCP_HTTP_PORT=8001
```

Фактические secret values в GitHub и документацию не записываются.

Права файла:

`600 root:root`

## Проверки

Подтверждены:

- systemd startup;
- listening socket;
- MCP initialize;
- MCP tools/list;
- OAuth token request;
- прямой Performance API request;
- MCP tools/call;
- HTTP 200 от Performance API.

Контрольный вызов:

`ozonperf_get_api_client_campaign`

Результат:

```
HTTP 200
list = []
total = "0"
```

## Восстановление

Минимальная последовательность:

1. установить `uv`;
2. установить/получить `marketplaces-mcp-ru 0.6.1`;
3. создать `perf.env` с Performance credentials;
4. установить `ozon-performance.service`;
5. запустить сервис;
6. проверить `:8001/mcp`;
7. выполнить OAuth test;
8. выполнить MCP initialize;
9. выполнить `ozon_perf_call_method` для `ozonperf_get_api_client_campaign`.

Секреты должны вводиться непосредственно на VPS и не переноситься в Git.


## Next reproducible deployment

The previous production command used unpinned uvx --from marketplaces-mcp-ru ozon-perf-mcp.
The repository now contains a reproducible installer:

deploy/scripts/install-performance-mcp.sh

It:
1. checks out upstream commit ec2114595695536e001e09e1144a357118852db1;
2. replaces only ozon_mcp/perf_endpoints.yaml with the audited 48-operation catalog;
3. installs the package into /opt/kvantexpert/marketplaces-mcp-ru/.venv;
4. leaves Seller MCP :8000 untouched.

The tracked systemd unit now points to that local virtualenv. The live VPS is NOT considered migrated until the installer has been run and the full 48-operation live audit passes.
