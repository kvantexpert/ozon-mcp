# Состояние сервера Ozon MCP

Фактическая фиксация текущего VPS: 22 сентября 2026.

## Сервер

- ОС: Ubuntu 22.04.4 LTS (Jammy Jellyfish)
- MCP endpoint: https://ozon-mcp.kvantexpert.ru/mcp
- MCP backend: 127.0.0.1:8000
- Nginx: 80/443
- systemd service: ozon-mcp.service
- systemd service включен: yes
- сервис работает от root
- рабочий каталог: /root
- credentials: /root/.config/ozon-mcp/env
- права credentials: 600, root:root
- секреты в GitHub не хранятся.

## UV

- uv: 0.12.17
- uvx: 0.12.17

## Запуск

Текущий systemd запускает:
/root/.local/bin/uvx --from ozon-mcp-ru ozon-mcp-ru

Текущая конфигурация намеренно сохранена без изменения поведения.

## Nginx

Production использует HTTPS через Let's Encrypt и проксирует /mcp на 127.0.0.1:8000. Сертификатные пути создаются Certbot и не хранятся в Git.

## Credentials

Файл: /root/.config/ozon-mcp/env

Переменные:
OZON_CLIENT_ID=
OZON_API_KEY=

Реальные значения никогда не добавлять в GitHub.

## Восстановление

Новый VPS -> Ubuntu -> uv -> nginx + certbot -> env -> systemd -> MCP 127.0.0.1:8000 -> HTTPS -> проверка MCP -> проверка Ozon API.

## Версии пакетов

- ozon-mcp-ru: 0.6.0

Версия зафиксирована в deployment-конфигурации systemd, чтобы восстановление сервера использовало ту же версию пакета.

## Не переносится

Не включаются: credentials, TLS private key, TLS certificates, журналы, uv cache, реальные цифровые коды и Ozon API secrets.
