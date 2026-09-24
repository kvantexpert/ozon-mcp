# VPS Ozon MCP — зафиксированное состояние

Дата фиксации: 2026-09-24

## Runtime

- ozon-mcp-ru: 0.6.0
- marketplaces-mcp-ru: 0.6.1
- transport: MCP stdio внутри uvx
- production MCP: https://ozon-mcp.kvantexpert.ru/mcp
- backend: 127.0.0.1:8000
- systemd: ozon-mcp.service

## Upstream

- https://github.com/ilyautov/ozon-mcp-ru
- https://github.com/ilyautov/marketplaces-mcp-ru

## Ozon import

- POST /v3/product/import
- максимум 100 товаров за запрос
- асинхронный ответ с task_id
- статус: POST /v1/product/import/info

## Credentials

Реальные OZON_CLIENT_ID и OZON_API_KEY в GitHub не сохраняются.
На VPS: /root/.config/ozon-mcp/env
