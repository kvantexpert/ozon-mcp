# Digital delivery — остаток, заказ, posting и код

## 1. Три разные сущности

### Карточка
Описание продукта: `product_id`, `offer_id`, attributes, price, images.

### Остаток
Количество доступных цифровых единиц: `stock`.

### Конкретный код
Конкретный ключ, который должен быть передан покупателю.

Нельзя смешивать эти уровни.

## 2. Подтвержденный digital stock

Рабочий endpoint:

`POST /v1/product/digital/stocks/import`

MCP operation:

`ozon_post_v1_product_digital_stocks_import`

Для эталона:

```json
{
  "stocks": [
    {
      "offer_id": "4601546116680",
      "stock": 1
    }
  ]
}
```

Ozon ответил `updated=true`.

Независимый READ через:

`POST /v4/product/info/stocks`

подтвердил:

- `present=1`
- `reserved=0`
- `type=fbo`
- `sku=5865629857`

Это доказало реальное изменение Ozon после MCP WRITE.

## 3. Что означает stock=1

Это доступная единица цифрового товара.

Это НЕ доказательство:

- существования конкретного digital code;
- того, что код уже выбран;
- того, что код уже выдан покупателю.

## 4. Digital posting

Исследован:

`POST /v2/posting/digital/list`

Модель поддерживает:

- order_numbers;
- posting_numbers;
- since;
- to;
- cursor;
- limit;
- sort_dir;
- analytics_data;
- financial_data;
- legal_info.

Posting может содержать:

- posting_number;
- order_number;
- status;
- created_at;
- waiting_deadline_for_digital_code;
- products;
- offer_id;
- sku;
- required_qty_for_digital_code.

## 5. Почему posting пока нет

Прямой запрос за период:

`2026-09-01T00:00:00Z → 2026-09-22T23:59:59Z`

вернул:

```json
{
  "has_next": false,
  "cursor": "",
  "postings": []
}
```

Поэтому у тестового товара пока нет реального `posting_number`.

## 6. Выдача кода для конкретного posting

Исследован endpoint:

`POST /v1/posting/digital/codes/upload`

MCP operation:

`ozon_post_v1_posting_digital_codes_upload`

Запрос содержит:

- `posting_number`;
- `exemplars_by_sku`;
- `sku`;
- `exemplar_qty`;
- `not_available_exemplar_qty`;
- `exemplar_keys`.

Пример структуры:

```json
{
  "posting_number": "0001-1",
  "exemplars_by_sku": [
    {
      "sku": 5865629857,
      "exemplar_qty": 1,
      "not_available_exemplar_qty": 0,
      "exemplar_keys": ["CODE-1"]
    }
  ]
}
```

Это операция для конкретного заказа/отправления, а не создание карточки.

## 7. Старый endpoint загрузки кодов

Был исследован:

`POST /v1/product/upload_digital_codes`

MCP operation:

`ozon_upload_activation_codes`

Через MCP и напрямую с VPS к Ozon был получен:

`404 page not found`

Следовательно, 404 приходит от текущего Ozon endpoint, а не из-за MCP.

Статус: **STALE / НЕ ИСПОЛЬЗОВАТЬ** без нового подтверждения актуальности.

## 8. Полный жизненный цикл

```
CARD
  ↓
STOCK
  ↓
ORDER
  ↓
POSTING
  ↓
DIGITAL CODE
  ↓
DELIVERY
```

Доказаны только CARD → STOCK.

ORDER → POSTING → CODE → DELIVERY пока не прошли реальным заказом.

## 9. План следующего теста

Когда появится безопасный тестовый digital posting:

1. получить posting_number;
2. получить sku;
3. проверить required_qty_for_digital_code;
4. использовать отдельный тестовый код;
5. выполнить `/v1/posting/digital/codes/upload`;
6. прочитать posting;
7. проверить результат;
8. проверить остаток;
9. зафиксировать точную цепочку в TEST_HISTORY.md.

Реальные digital codes нельзя публиковать в GitHub, issues, README или обычных логах.
