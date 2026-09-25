# Performance MCP — контрольная точка 2026-09-26

## Назначение

Этот документ фиксирует состояние проекта после первого полного запуска и end-to-end теста Ozon Performance MCP на рабочем VPS.

Это **отправная точка для дальнейшей разработки**. Будущие изменения должны опираться на эту зафиксированную конфигурацию и не ломать существующий Seller MCP.

## Что было сделано

На VPS обнаружена готовая реализация Ozon Performance внутри пакета `marketplaces-mcp-ru 0.6.1`.

Используется модуль:

- `ozon_perf_mcp`
- entrypoint: `ozon-perf-mcp`
- каталог методов: `ozon_mcp/perf_endpoints.yaml`
- workflow-конфигурация: `ozon_perf_mcp/workflows.yaml`

Каталог содержит **45 Performance API operation_id**.

Для Performance создан отдельный systemd-сервис:

`ozon-performance.service`

Он запускает:

`uvx --from marketplaces-mcp-ru ozon-perf-mcp`

и слушает только:

`127.0.0.1:8001`

Seller MCP при этом остался без изменений:

`ozon-mcp.service → 127.0.0.1:8000`

## Текущая архитектура

```
                         VPS cv7976275
                              |
              +---------------+---------------+
              |                               |
       Seller MCP                       Performance MCP
   ozon-mcp.service               ozon-performance.service
       :8000                             :8001
              |                               |
              v                               v
       Ozon Seller API                 Ozon Performance API
              |                               |
              +---------------+---------------+
                              |
                         Ozon account
```

Публичным сейчас остается только существующий Seller MCP:

`https://ozon-mcp.kvantexpert.ru/mcp`

Performance MCP **намеренно не опубликован наружу**. Порт 8001 доступен только локально на VPS.

## Credentials

Performance использует отдельные credentials:

- `OZON_PERF_CLIENT_ID`
- `OZON_PERF_CLIENT_SECRET`

Файл на VPS:

`/root/.config/ozon-mcp/perf.env`

Права:

`root:root 600`

Секретные значения в GitHub не фиксируются.

## Подтвержденный OAuth

Проверен реальный OAuth flow:

`POST https://api-performance.ozon.ru/api/client/token`

с `grant_type=client_credentials`.

Результат:

- HTTP 200;
- `token_type=Bearer`;
- `expires_in=1800`;
- access token успешно получен.

## Подтвержденный прямой API вызов

Проверен:

`GET /api/client/campaign`

Результат:

- HTTP 200;
- `list: []`;
- `total: "0"`.

На момент проверки в Performance-кабинете нет рекламных кампаний. Это не ошибка подключения.

## Подтвержденный MCP flow

Проверена полная цепочка:

```
MCP initialize
    ↓
tools/list
    ↓
tools/call
    ↓
ozon_perf_call_method
    ↓
OAuth
    ↓
Ozon Performance API
    ↓
HTTP 200
```

Фактический MCP вызов:

`ozon_perf_call_method`

с:

`operation_id = ozonperf_get_api_client_campaign`

вернул:

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

Таким образом, Performance MCP считается **технически работоспособным end-to-end**.

## Каталог Performance API

В установленной реализации доступны 45 operation_id, включая группы:

- кампании;
- лимиты;
- статистика;
- отчеты;
- товары кампаний;
- ставки;
- Search Promo;
- CPO;
- активация/деактивация кампаний;
- dynamic budget;
- vendor statistics;
- vendor tag.

Полный актуальный каталог должен извлекаться из установленного `perf_endpoints.yaml`, а не восстанавливаться по памяти.

## Важное ограничение текущего этапа

Сейчас подтверждена работоспособность инфраструктуры и read-вызова.

Еще **не принято решение**, какие Performance-инструменты будут доступны внешнему AI-клиенту.

Не следует:

- открывать `:8001` напрямую в Интернет;
- менять существующий Seller MCP без необходимости;
- выдавать наружу весь набор write-инструментов без отдельной проверки;
- переносить credentials в GitHub;
- считать наличие operation_id достаточным доказательством безопасности конкретной write-операции.

## Следующий план

### Этап 1 — исследование read API

Проверить через MCP несколько ключевых read-операций:

1. список кампаний;
2. лимиты;
3. товары кампаний;
4. статистику;
5. отчеты;
6. дополнительные данные, необходимые для управления рекламой.

Для каждого фактического теста фиксировать:

- operation_id;
- HTTP method;
- endpoint;
- входные параметры без секретов;
- HTTP status;
- сокращенный результат;
- ошибки;
- вывод.

### Этап 2 — определить минимальный набор AI-инструментов

Отделить:

- безопасные READ;
- операции подготовки изменений;
- WRITE;
- потенциально опасные/destructive операции.

Не публиковать все 45 методов автоматически только потому, что они существуют в каталоге.

### Этап 3 — внешний MCP доступ

Выбрать архитектуру доступа AI-клиента к Performance MCP.

До принятия решения:

- 8001 остается loopback;
- Seller MCP остается на 8000;
- существующий публичный endpoint не меняется.

### Этап 4 — write-операции

Проверять отдельно:

- активацию/деактивацию;
- изменение товаров кампании;
- ставки;
- Search Promo;
- бюджеты.

Перед публикацией write-инструментов проверить механизм подтверждения, параметры и возможность безопасной верификации результата.

### Этап 5 — единая документация

После завершения каждого этапа обновлять:

- этот baseline;
- `server/` runtime-документацию;
- историю тестов;
- deployment-документацию при изменении инфраструктуры.

## Правило возврата к этой точке

Если дальнейшая разработка Performance MCP приведет к проблемам, контрольная точка означает:

- Seller MCP работает на `:8000`;
- Performance MCP работает на `:8001`;
- Performance credentials находятся только в `perf.env`;
- OAuth проходит;
- `ozon_perf_call_method` работает;
- `ozonperf_get_api_client_campaign` возвращает HTTP 200;
- публичного Performance endpoint еще нет.

Это состояние считается базовой точкой для следующих изменений.
