# Ozon MCP

MCP server, deployment configuration and long-term knowledge base for Ozon Seller integration.

## Public endpoint

`https://ozon-mcp.kvantexpert.ru/mcp`

Ozon credentials are server-side only. Never commit credentials, API keys, cookies or real digital codes.

## Documentation

This repository is intended to remain usable as a project knowledge base months or years later.

- [Project model](docs/PROJECT_MODEL.md)
- [Card lifecycle](docs/CARD_LIFECYCLE.md)
- [Attributes and dictionaries](docs/ATTRIBUTES_AND_DICTIONARIES.md)
- [Ozon operations](docs/OZON_OPERATIONS.md)
- [Digital delivery](docs/DIGITAL_DELIVERY.md)
- [Test history](docs/TEST_HISTORY.md)
- [AI maintenance instructions](docs/AI_MAINTENANCE.md)

## Reference product

**1С:Бухгалтерия 8 ПРОФ. Электронная поставка**

- offer_id: `4601546116680`
- product_id: `6417979753`
- sku: `5865629857`
- description_category_id: `200001489` — Цифровые товары
- type_id: `971075562` — Код активации офисного приложения
- price: `23000 RUB`
- VAT: `0`

The product was created, characteristics were written and verified, an image was accepted as primary, and digital stock was successfully changed from 0 to 1 through MCP and independently verified through Ozon.

## Core engineering rule

Use:

`DISCOVER → READ → VALIDATE → WRITE → VERIFY → DOCUMENT`

Do not guess license terms or dictionary values.

For digital fulfillment, keep the separate lifecycle:

`CARD → STOCK → ORDER → POSTING → CODE → DELIVERY`

The final order-to-code-to-delivery path has not yet been completed with a real posting and must remain explicitly marked as unverified until tested.

## Repository rule

Every important discovery or experiment should update the relevant document in `docs/`. Record dates, operation IDs, endpoints, inputs without secrets, outputs, errors, conclusions and next steps.