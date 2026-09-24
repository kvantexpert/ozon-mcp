# История фактических тестов

Документ разделяет **доказанные факты** и предположения.

## 1. Создание карточки

Создан товар:

**1С:Бухгалтерия 8 ПРОФ. Электронная поставка**

Результат:

- product_id = 6417979753
- offer_id = 4601546116680
- sku = 5865629857
- type_id = 971075562
- description_category_id = 200001489
- price = 23000.00
- vat = 0.00

Статус импорта:

`imported`

Ошибок:

`[]`

## 2. Характеристики

Подтверждены обратным чтением:

- 8229 — Код активации офисного приложения;
- 85 — 1С;
- 77 — 1С;
- 9279 — Бухгалтерия;
- 5162 — Windows;
- 11469 — Русская версия;
- 74 — 1С;
- 4180 — название;
- 9024 — код продавца;
- 4191 — аннотация;
- 9870 — системные требования;
- 9910 — инструкция.

## 3. WRITE safety

Попытка выполнить `ozon_update_characteristics` через read-only `ozon_call_method` была остановлена MCP safety gate.

Результат:

- запрос в Ozon не ушел;
- MCP потребовал `ozon_write_method`.

После этого WRITE был выполнен правильно.

## 4. Characteristics WRITE

Operation:

`ozon_update_characteristics`

Ozon вернул:

`task_id = 5678718317`

После polling:

- status = imported;
- errors = [].

## 5. Изображение

Operation:

`ozon_product_pictures_import`

Загружен:

`cover.webp`

Ozon:

- state = imported;
- is_primary = true.

Карточка после этого перестала быть заблокированной причиной отсутствия фото.

## 6. Исходный stock

Прямой:

`POST /v4/product/info/stocks`

вернул:

- present = 0;
- reserved = 0;
- sku = 5865629857.

## 7. Digital stock WRITE

Operation:

`ozon_post_v1_product_digital_stocks_import`

Установлено:

`stock = 1`

Ответ:

- updated = true;
- errors = [];
- product_id = 6417979753;
- sku = 5865629857.

## 8. Независимый stock READ

Повторный прямой:

`POST /v4/product/info/stocks`

вернул:

- present = 1;
- reserved = 0;
- type = fbo;
- sku = 5865629857.

Это доказало реальное изменение состояния Ozon.

## 9. Старый digital code endpoint

Проверен:

`POST /v1/product/upload_digital_codes`

Через MCP:

`404 page not found`

Прямо через Ozon API с VPS:

`404 page not found`

Вывод:

**404 возникает на стороне Ozon, а не MCP.**

## 10. Digital posting list

Прямой:

`POST /v2/posting/digital/list`

с фильтром:

`2026-09-01T00:00:00Z → 2026-09-22T23:59:59Z`

вернул:

- HTTP 200;
- has_next=false;
- postings=[].

## 11. v1 digital list

`POST /v1/posting/digital/list`

с пустым body вернул 400:

`invalid ListPostingCodesRequest.Filter: value is required`

MCP catalog помечает operation deprecated.

## 12. Что доказано

Доказано:

- MCP доступен;
- Ozon credentials работают;
- создание карточки работает;
- изменение characteristics работает;
- dictionary search работает;
- image import работает;
- digital stock import работает;
- stock read работает;
- v2 digital posting list работает напрямую.

Не доказано:

- реальный digital order;
- реальный posting_number;
- загрузка кода в реальный posting;
- фактическая выдача кода покупателю.

## 13. Важная временная отметка

Эта база знаний описывает состояние исследования на **22 сентября 2026 года**.

Ozon Seller API может изменяться. Перед продолжением проекта всегда перепроверять актуальные endpoints и schemas.
