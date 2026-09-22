# Жизненный цикл карточки цифрового товара

## 1. Этап 0 — входные данные товара

До обращения к Ozon собрать:

- название;
- артикул продавца;
- цену;
- НДС;
- бренд;
- разработчика;
- издателя;
- платформу;
- язык;
- описание;
- системные требования;
- инструкцию;
- изображения;
- реальные лицензионные условия.

Особенно подтвердить:

- территорию активации;
- территорию использования;
- срок действия;
- срок активации;
- количество устройств;
- издание;
- версию ОС.

Если данные не подтверждены — не заполнять их угадыванием.

## 2. Этап 1 — поиск категории

Сначала определяется Ozon category tree.

Для эталона:

`200001489 = Цифровые товары`

затем:

`971075562 = Код активации офисного приложения`

Категория определяет доступные attributes.

## 3. Этап 2 — получение актуальных attributes

Получить актуальную схему:

- attribute_id;
- название;
- тип;
- required;
- dictionary_id;
- collection;
- max values;
- category-dependent.

Для эталона обязательным оказался только:

`8229 = Тип`

Остальные поля были optional в полученном актуальном ответе.

Нельзя переносить список attributes в код как вечную константу: Ozon может изменить категорию.

## 4. Этап 3 — подготовка характеристик

Для каждого поля:

1. определить attribute_id;
2. определить, нужен ли dictionary;
3. если dictionary — найти value;
4. проверить, что значение действительно относится к товару;
5. сформировать payload.

## 5. Этап 4 — создание товара

Использовался:

`POST /v3/product/import`

Создан:

- product_id = 6417979753
- SKU = 5865629857

После создания сохранить связь:

`offer_id ↔ product_id ↔ sku`

## 6. Этап 5 — характеристики

Изменение выполняется через operation:

`ozon_update_characteristics`

Endpoint:

`POST /v1/product/attributes/update`

Это WRITE operation.

Через `ozon_call_method` её выполнять нельзя. Использовать `ozon_write_method` и `confirm_write=true`.

## 7. Этап 6 — task/status

Ozon может вернуть task_id.

Пример:

`5678718317`

После WRITE:

1. получить task_id;
2. проверить импорт;
3. убедиться в отсутствии errors;
4. перечитать карточку.

## 8. Этап 7 — изображения

Используется:

`ozon_product_pictures_import`

Endpoint:

`POST /v1/product/pictures/import`

Payload содержит product_id и images[].

Для эталона Ozon принял cover.webp и сделал его primary.

Без изображения карточка первоначально была HIDDEN с причиной «Нет фото в карточке товара».

## 9. Этап 8 — цена

Для эталона:

- price = 23000 RUB
- vat = 0

После записи цену проверять через product info.

## 10. Этап 9 — проверка модерации

Проверять:

- moderate_status;
- validation_status;
- status;
- status_description;
- primary_image;
- visibility_details.

Для эталона:

- moderate_status = approved;
- validation_status = success;
- status_name = Готов к продаже.

## 11. Этап 10 — digital stock

Используется:

`POST /v1/product/digital/stocks/import`

Operation:

`ozon_post_v1_product_digital_stocks_import`

Payload:

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

В тесте Ozon ответил:

`updated=true`

и вернул product_id и sku.

## 12. Этап 11 — независимая проверка stock

Использован:

`POST /v4/product/info/stocks`

Ozon подтвердил:

- present = 1;
- reserved = 0;
- sku = 5865629857.

Это доказало, что MCP WRITE реально изменил состояние Ozon.

## 13. Этап 12 — заказ

Следующая стадия должна создать digital posting.

Пока реального заказа не было.

Read-only проверка `/v2/posting/digital/list` за 2026-09-01—2026-09-22 вернула пустой список.

## 14. Этап 13 — digital code

Для конкретного posting найден:

`POST /v1/posting/digital/codes/upload`

Нужны:

- posting_number;
- sku;
- exemplar_qty;
- not_available_exemplar_qty;
- exemplar_keys.

Эта операция не является созданием карточки.

## 15. Этап 14 — доставка

Фактическая выдача кода покупателю пока не протестирована.

Следующий боевой тест должен выполняться только при наличии реального digital posting и безопасного тестового кода.

## 16. Финальный pipeline

```
INPUT
 ↓
CATEGORY
 ↓
TYPE
 ↓
ATTRIBUTES
 ↓
DICTIONARIES
 ↓
CREATE
 ↓
CHARACTERISTICS
 ↓
IMAGES
 ↓
PRICE
 ↓
MODERATION/VALIDATION
 ↓
DIGITAL STOCK
 ↓
ORDER
 ↓
POSTING
 ↓
DIGITAL CODE
 ↓
DELIVERY
 ↓
VERIFY
```
