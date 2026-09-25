# Состояние сервера Ozon MCP

Фактическая фиксация текущего VPS: 26 сентября 2026.

## Сервер

- ОС: Ubuntu 22.04.4 LTS (Jammy Jellyfish)
- MCP endpoint Seller: https://ozon-mcp.kvantexpert.ru/mcp
- Seller MCP backend: 127.0.0.1:8000
- Performance MCP backend: 127.0.0.1:8001
- Nginx: 80/443
- Seller systemd service: ozon-mcp.service
- Performance systemd service: ozon-performance.service
- оба сервиса включены и работают
- сервисы работают от root
- рабочий каталог: /root
- Seller credentials: /root/.config/ozon-mcp/env
- Performance credentials: /root/.config/ozon-mcp/perf.env
- credentials имеют права 600, root:root
- секреты в GitHub не хранятся.

## Seller MCP

Production Seller MCP сохранен без изменения поведения.

Запуск:

`/root/.local/bin/uvx --from ozon-mcp-ru ozon-mcp-ru`

Версия:

- ozon-mcp-ru: 0.6.0

Backend:

`127.0.0.1:8000`

Публичный endpoint:

`https://ozon-mcp.kvantexpert.ru/mcp`

## Performance MCP

Создан отдельный сервис:

`ozon-performance.service`

Запуск:

`/root/.local/bin/uvx --from marketplaces-mcp-ru ozon-perf-mcp`

Версия:

- marketplaces-mcp-ru: 0.6.1
- upstream commit: `ec2114595695536e001e09e1144a357118852db1`

Backend:

`127.0.0.1:8001`

Транспорт:

Streamable HTTP.

Публичного endpoint для Performance MCP пока нет. Порт 8001 намеренно остается loopback-only.

## Performance credentials

Файл:

`/root/.config/ozon-mcp/perf.env`

Переменные:

`OZON_PERF_CLIENT_ID`

`OZON_PERF_CLIENT_SECRET`

Реальные значения никогда не добавлять в GitHub.

## Подтвержденная работоспособность Performance

Подтверждены:

1. OAuth client_credentials;
2. получение Bearer token;
3. прямой запрос к Performance API;
4. MCP initialize;
5. MCP tools/list;
6. MCP tools/call;
7. вызов `ozon_perf_call_method`;
8. operation `ozonperf_get_api_client_campaign`.

Контрольный результат:

```json
{
  "ok": true,
  "status": 200,
  "data": {
    "list": [],
    "total": "0"
  }
}
```

## Nginx

Production Seller MCP использует HTTPS через Let's Encrypt и проксирует `/mcp` на 127.0.0.1:8000.

Performance MCP пока не добавлен в nginx.

## Восстановление

### Seller

Ubuntu -> uv -> nginx + certbot -> env -> systemd -> MCP 127.0.0.1:8000 -> HTTPS -> проверка MCP -> проверка Ozon API.

### Performance

Ubuntu -> uv -> `marketplaces-mcp-ru 0.6.1` -> `perf.env` -> `ozon-performance.service` -> MCP 127.0.0.1:8001 -> OAuth -> Performance API -> MCP tool call.

## Не переносится

Не включаются:

- credentials;
- TLS private key;
- TLS certificates;
- журналы;
- uv cache;
- реальные цифровые коды;
- Ozon API secrets;
- Performance client secret.

## Следующая точка разработки

Перед публикацией Performance MCP наружу необходимо:

1. закончить проверку необходимых READ методов;
2. определить минимальный набор инструментов для AI;
3. отдельно проверить WRITE методы;
4. выбрать безопасную схему внешнего MCP доступа;
5. не менять Seller MCP без необходимости.

Подробная контрольная точка: `docs/PERFORMANCE_MCP_BASELINE_2026-09-26.md`.
