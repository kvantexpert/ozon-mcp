# Модель проекта Ozon MCP

## 1. Архитектура

Основная цепочка:

```
AI / Timeweb Agent
        |
        v
Ozon MCP
        |
        v
Ozon Seller API
        |
        +--> Category
        +--> Product Card
        +--> Attributes
        +--> Price
        +--> Images
        +--> Digital Stock
        +--> Digital Postings
        +--> Digital Codes
```

Публичный MCP:

`https://ozon-mcp.kvantexpert.ru/mcp`

Credentials остаются на сервере.

## 2. Сущности

### offer_id

Артикул продавца. Для эталонного товара:

`4601546116680`

Используется, в частности, при изменении цифрового остатка.

### product_id

Идентификатор карточки Ozon:

`6417979753`

Используется для характеристик, изображений и других операций карточки.

### SKU

Идентификатор товара Ozon:

`5865629857`

Используется в некоторых операциях цифровых отправлений.

### description_category_id

Категория Ozon:

`200001489 = Цифровые товары`

### type_id

Тип внутри категории:

`971075562 = Код активации офисного приложения`

### posting_number

Идентификатор конкретного цифрового отправления/заказа. Для тестового товара пока не получен, потому что реальных digital postings нет.

## 3. Разделение данных

Карточка должна рассматриваться как четыре слоя:

### Идентификация

- offer_id
- product_id
- sku
- name
- description_category_id
- type_id

### Коммерческие данные

- price
- vat
- stock
- reserved

### Контент карточки

- attributes
- annotation
- system requirements
- instruction
- images
- primary_image

### Цифровая реализация

- digital stock
- posting_number
- digital posting
- digital code
- delivery/result status

Изменение описания карточки и выдача кода покупателю — разные процессы.

## 4. Принцип READ/WRITE

READ операции:

- discovery;
- чтение карточки;
- получение attributes;
- поиск словаря;
- чтение stocks;
- чтение digital postings.

WRITE операции:

- создание товара;
- изменение characteristics;
- импорт изображений;
- изменение digital stock;
- загрузка кода для posting.

Нельзя определять безопасность только по названию операции. Каталог operation должен считаться источником текущего safety-класса.

## 5. Универсальный pipeline

```
DISCOVER
  |
  v
READ
  |
  v
VALIDATE
  |
  v
WRITE
  |
  v
TASK / STATUS
  |
  v
VERIFY
```

После любого изменения нужно читать состояние обратно.

## 6. AI должен хранить связь

AI должен мыслить не отдельными полями, а связями:

```
category
  -> type
     -> attributes
        -> dictionary values
           -> product
              -> product_id / sku
                 -> stock
                    -> posting
                       -> digital code
```

Это предотвращает ошибки вида «у нас есть SKU, значит уже есть заказ» или «stock=1 значит конкретный код уже выдан».
