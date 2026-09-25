# Ozon Performance API — полная матрица 48 операций

> Зафиксировано: **2026-09-26**. Источник схем: актуальный OpenAPI Ozon Performance API, репозиторий `MissiaL/ozon-api`, файл `references/ozon-performance-openapi.json`, blob SHA `c1d098e0bd9fd6ad8e6ff825b2c8451a531f8d7d`. Схемы ниже извлечены непосредственно из OpenAPI, без угадывания по URL.

## Статус

- Актуальный OpenAPI: **48 операций**.
- Текущий `marketplaces-mcp-ru 0.6.1`: **45 операций**.
- Отсутствуют в текущем MCP: **3 операции**.
- Safety классификация ниже нормализована по семантике операции, а не только по HTTP-методу.
- `read` — получение/расчёт данных без изменения состояния рекламного кабинета.
- `write` — создание/изменение/включение/отключение/установка параметров.
- `destructive` — удаление.

## Сводная таблица

| # | Method | Endpoint | Operation ID | Safety | MCP 45 |
|---:|---|---|---|---|---|
| 1 | `GET` | `/api/client/campaign` | `ListCampaigns` | **read** | ozonperf_get_api_client_campaign |
| 2 | `PATCH` | `/api/client/campaign/{campaignId}` | `PatchProductCampaign` | **write** | **MISSING** |
| 3 | `POST` | `/api/client/campaign/{campaignId}/activate` | `ActivateCampaign` | **write** | ozonperf_post_api_client_campaign_campaignid_activate |
| 4 | `POST` | `/api/client/campaign/{campaignId}/deactivate` | `DeactivateCampaign` | **write** | ozonperf_post_api_client_campaign_campaignid_deactivate |
| 5 | `GET` | `/api/client/campaign/{campaignId}/objects` | `ListCampaignObjects` | **read** | ozonperf_get_api_client_campaign_campaignid_objects |
| 6 | `POST` | `/api/client/campaign/{campaignId}/products` | `AddProducts` | **write** | ozonperf_post_api_client_campaign_campaignid_products |
| 7 | `PUT` | `/api/client/campaign/{campaignId}/products` | `UpdateProducts` | **write** | ozonperf_put_api_client_campaign_campaignid_products |
| 8 | `GET` | `/api/client/campaign/{campaignId}/products/bids/competitive` | `GetProductsCompetitiveBids` | **read** | ozonperf_get_api_client_campaign_campaignid_products_bids_co |
| 9 | `POST` | `/api/client/campaign/{campaignId}/products/delete` | `DeleteProducts` | **destructive** | ozonperf_post_api_client_campaign_campaignid_products_delete |
| 10 | `GET` | `/api/client/campaign/{campaignId}/v2/products` | `GetProductsV2` | **read** | ozonperf_get_api_client_campaign_campaignid_products |
| 11 | `GET` | `/api/client/campaign/all_sku_promo/activate` | `ActivateAllSkuPromoCampaign` | **write** | ozonperf_get_api_client_campaign_all_sku_promo_activate |
| 12 | `GET` | `/api/client/campaign/all_sku_promo/deactivate` | `DeactivateAllSkuPromoCampaign` | **write** | ozonperf_get_api_client_campaign_all_sku_promo_deactivate |
| 13 | `GET` | `/api/client/campaign/all_sku_promo/set_bid` | `SetAllSkuPromoCampaignBid2` | **write** | **MISSING** |
| 14 | `POST` | `/api/client/campaign/cpc/v2/product` | `CreateProductCampaignCPCV2` | **write** | ozonperf_post_api_client_campaign_cpc_product |
| 15 | `POST` | `/api/client/campaign/search_promo/carrots/disable` | `ExternalCampaign_BatchDisableCarrots4` | **write** | ozonperf_post_api_client_campaign_search_promo_carrots_disab |
| 16 | `POST` | `/api/client/campaign/search_promo/carrots/enable` | `ExternalCampaign_BatchEnableCarrots4` | **write** | ozonperf_post_api_client_campaign_search_promo_carrots_enabl |
| 17 | `POST` | `/api/client/campaign/search_promo/v2/bids/delete` | `ExternalCampaign_DeleteSearchPromoBidsV2` | **destructive** | ozonperf_post_api_client_campaign_search_promo_bids_delete |
| 18 | `POST` | `/api/client/campaign/search_promo/v2/bids/set` | `ExternalCampaign_SetSearchPromoBidsV2` | **write** | ozonperf_post_api_client_campaign_search_promo_bids_set |
| 19 | `POST` | `/api/client/campaign/search_promo/v2/products` | `ExternalCampaign_ListSearchPromoProductsV2` | **read** | ozonperf_post_api_client_campaign_search_promo_products |
| 20 | `GET` | `/api/client/limits/list` | `GetLimitsList` | **read** | ozonperf_get_api_client_limits_list |
| 21 | `POST` | `/api/client/min/sku` | `ExternalCampaign_BidBySKU` | **read** | ozonperf_post_api_client_min_sku |
| 22 | `GET` | `/api/client/organisation/vendor_tag` | `GetVendorTag` | **read** | ozonperf_get_api_client_organisation_vendor_tag |
| 23 | `GET` | `/api/client/products_with_bonuses` | `ExternalCampaign_ListProductsWithBonuses2` | **read** | ozonperf_get_api_client_products_with_bonuses |
| 24 | `POST` | `/api/client/search_promo/bids/recommendation` | `ExternalCampaign_GetProductsRecommendedBids` | **read** | ozonperf_post_api_client_search_promo_bids_recommendation |
| 25 | `POST` | `/api/client/search_promo/get_cpo_min_bids` | `ExternalCampaign_GetCPOMinBids` | **read** | ozonperf_post_api_client_search_promo_get_cpo_min_bids |
| 26 | `POST` | `/api/client/search_promo/product/disable` | `ExternalCampaign_BatchDisableProducts` | **write** | ozonperf_post_api_client_search_promo_product_disable |
| 27 | `POST` | `/api/client/search_promo/product/enable` | `ExternalCampaign_BatchEnableProducts` | **write** | ozonperf_post_api_client_search_promo_product_enable |
| 28 | `POST` | `/api/client/statistic/orders/generate` | `SearchPromoOrdersReportSubmitRequest` | **read** | ozonperf_post_api_client_statistic_orders_generate |
| 29 | `POST` | `/api/client/statistic/products/generate` | `SearchPromoProductsReportSubmitRequest` | **read** | ozonperf_post_api_client_statistic_products_generate |
| 30 | `POST` | `/api/client/statistics` | `SubmitRequest` | **read** | ozonperf_post_api_client_statistics |
| 31 | `GET` | `/api/client/statistics/{UUID}` | `StatisticsCheck` | **read** | ozonperf_get_api_client_statistics_uuid |
| 32 | `GET` | `/api/client/statistics/all_sku_promo/orders/generate` | `GenerateAllSkuPromoOrdersReport` | **read** | ozonperf_get_api_client_statistics_all_sku_promo_orders_gene |
| 33 | `GET` | `/api/client/statistics/all_sku_promo/products/generate` | `GenerateAllSkuPromoProductsReport` | **read** | ozonperf_get_api_client_statistics_all_sku_promo_products_ge |
| 34 | `POST` | `/api/client/statistics/attribution` | `AttributionSubmitRequest` | **read** | ozonperf_post_api_client_statistics_attribution |
| 35 | `GET` | `/api/client/statistics/campaign/media` | `MediaCampaignList` | **read** | ozonperf_get_api_client_statistics_campaign_media |
| 36 | `GET` | `/api/client/statistics/campaign/product` | `ProductCampaignList` | **read** | ozonperf_get_api_client_statistics_campaign_product |
| 37 | `GET` | `/api/client/statistics/daily` | `GetCampaignDailyStats` | **read** | ozonperf_get_api_client_statistics_daily |
| 38 | `GET` | `/api/client/statistics/expense` | `GetCampaignExpense` | **read** | ozonperf_get_api_client_statistics_expense |
| 39 | `GET` | `/api/client/statistics/externallist` | `ListReportsExternal` | **read** | ozonperf_get_api_client_statistics_externallist |
| 40 | `GET` | `/api/client/statistics/list` | `ListReports` | **read** | ozonperf_get_api_client_statistics_list |
| 41 | `POST` | `/api/client/statistics/phrases` | `ExternalStatistics_StatisticsPhrasesSubmitRequest2` | **read** | ozonperf_post_api_client_statistics_phrases |
| 42 | `POST` | `/api/client/statistics/products/sku` | `SearchPromoProductsSKUStatistics2` | **read** | **MISSING** |
| 43 | `GET` | `/api/client/statistics/report` | `DownloadStatistics` | **read** | ozonperf_get_api_client_statistics_report |
| 44 | `POST` | `/api/client/statistics/video` | `VideoCampaignsSubmitRequest` | **read** | ozonperf_post_api_client_statistics_video |
| 45 | `POST` | `/api/client/vendors/statistics` | `VendorStatisticsSubmitRequest` | **read** | ozonperf_post_api_client_vendors_statistics |
| 46 | `GET` | `/api/client/vendors/statistics/{UUID}` | `VendorStatisticsCheck` | **read** | ozonperf_get_api_client_vendors_statistics_uuid |
| 47 | `GET` | `/api/client/vendors/statistics/list` | `VendorStatisticsListReports` | **read** | ozonperf_get_api_client_vendors_statistics_list |
| 48 | `POST` | `/external/api/dynamic_budget` | `CalculateDynamicBudget` | **write** | ozonperf_post_external_api_dynamic_budget |

## Три операции, которых нет в текущем MCP

- `PATCH /api/client/campaign/{campaignId}` — `PatchProductCampaign` — **write**
- `GET /api/client/campaign/all_sku_promo/set_bid` — `SetAllSkuPromoCampaignBid2` — **write**
- `POST /api/client/statistics/products/sku` — `SearchPromoProductsSKUStatistics2` — **read**

## Полные request schemas

### 1. `ListCampaigns`

**GET /api/client/campaign**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_campaign`  
Summary: Список кампаний  

#### Path/query parameters

```json
[
  {
    "name": "campaignIds",
    "in": "query",
    "required": false,
    "schema": {
      "type": "array",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    },
    "description": "Список идентификаторов кампаний, для которых необходимо вывести информацию.\n\nЕсли передать значение, то в ответе будет информация по кампаниям, которые указаны\nв поле `campaigns`. Если поле пустое, информация будет отдана по всем кампаниям.\n"
  },
  {
    "name": "advObjectType",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string"
    },
    "description": "Тип рекламируемой кампании:\n- `SKU` — Оплата за клик;\n- `BANNER` — Баннерная рекламная кампания;\n- `SEARCH_PROMO` — Оплата за заказ;\n- `VIDEO_BANNER` — Видеобаннер.\n\n[Подробнее о типах рекламных кампаний](https://seller-edu.ozon.ru/docs/advertising/reklamnye-kampanii.html)\n"
  },
  {
    "name": "state",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "default": "CAMPAIGN_STATE_UNKNOWN",
      "enum": [
        "CAMPAIGN_STATE_UNKNOWN",
        "CAMPAIGN_STATE_RUNNING",
        "CAMPAIGN_STATE_PLANNED",
        "CAMPAIGN_STATE_STOPPED",
        "CAMPAIGN_STATE_INACTIVE",
        "CAMPAIGN_STATE_ARCHIVED",
        "CAMPAIGN_STATE_MODERATION_DRAFT",
        "CAMPAIGN_STATE_MODERATION_IN_PROGRESS",
        "CAMPAIGN_STATE_MODERATION_FAILED",
        "CAMPAIGN_STATE_FINISHED"
      ]
    },
    "description": "Состояние кампании.\n\nВозможные значения:\n- `CAMPAIGN_STATE_RUNNING` — активная кампания;\n- `CAMPAIGN_STATE_PLANNED` — кампания, сроки проведения которой ещё не наступили;\n- `CAMPAIGN_STATE_STOPPED` — кампания, приостановленная из-за нехватки бюджета;\n- `CAMPAIGN_STATE_INACTIVE` — кампания, остановленная владельцем;\n- `CAMPAIGN_STATE_ARCHIVED` — архивная кампания;\n- `CAMPAIGN_STATE_MODERATION_DRAFT` — отредактированная кампания до отправки на модерацию;\n- `CAMPAIGN_STATE_MODERATION_IN_PROGRESS` — кампания, отправленная на модерацию;\n- `CAMPAIGN_STATE_MODERATION_FAILED` — кампания, непрошедшая модерацию;\n- `CAMPAIGN_STATE_FINISHED` — кампания завершена, дата окончания в прошлом, такую кампанию нельзя изменить, можно\nтолько клонировать или создать новую.\n"
  },
  {
    "name": "page",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64"
    },
    "description": "Номер страницы. Пагинация начинается с единицы."
  },
  {
    "name": "pageSize",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64"
    },
    "description": "Размер страницы."
  }
]
```

#### Request body

None.

### 2. `PatchProductCampaign`

**PATCH /api/client/campaign/{campaignId}**  
Safety: **write**  
MCP operation: **MISSING in current 45-operation catalog**  
Summary: Параметры кампании  
Description: Метод для изменения параметров кампании.  

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64",
      "description": "Идентификатор кампании."
    },
    "description": null
  }
]
```

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "autopilot": {
      "type": "object",
      "description": "Информация о кампании. Обязательный параметр, если в параметре `productAutopilotStrategy` включена автостратегия.",
      "properties": {
        "categoryId": {
          "type": "string",
          "format": "uint64",
          "description": "Идентификатор категории."
        },
        "skuAddMode": {
          "type": "string",
          "description": "Разрешение на автоматическое добавление товаров из категории, которая указана в `categoryId`, в кампании с автостратегией `MAX_VIEWS`:\n\n- `PRODUCT_CAMPAIGN_SKU_ADD_MODE_UNKNOWN` — стратегия добавления товаров в кампанию не установлена;\n- `PRODUCT_CAMPAIGN_SKU_ADD_MODE_MANUAL` — добавлять товары в кампанию можно только вручную;\n- `PRODUCT_CAMPAIGN_SKU_ADD_MODE_AUTO` — можно добавлять товары категории `categoryId` в кампанию автоматически.\n\nЕсли тип разрешения пустой или было передано `PRODUCT_CAMPAIGN_SKU_ADD_MODE_UNKNOWN`, добавлять товары в кампанию можно только вручную.\n\nДля кампаний без автостратегии `MAX_VIEWS` возвращается значение `PRODUCT_CAMPAIGN_SKU_ADD_MODE_UNKNOWN`.\n",
          "enum": [
            "PRODUCT_CAMPAIGN_SKU_ADD_MODE_UNKNOWN",
            "PRODUCT_CAMPAIGN_SKU_ADD_MODE_MANUAL",
            "PRODUCT_CAMPAIGN_SKU_ADD_MODE_AUTO"
          ]
        }
      }
    },
    "fromDate": {
      "type": "string",
      "description": "Дата начала рекламной кампании по московскому времени.\n\nНе может быть раньше текущей даты.\n"
    },
    "toDate": {
      "type": "string",
      "description": "Дата окончания рекламной кампании по московскому времени.\n\nНе может быть раньше даты начала.\n"
    },
    "budget": {
      "type": "string",
      "format": "uint64",
      "description": "Ограничение общего бюджета рекламной кампании. Единица измерения — одна миллионная доля рубля, округляется до копеек. Например, значение `1 000 000` в параметре равно 1 рублю.\n\nУчитывается только для автоматических кампаний брендов и агентств. \nВ других организациях установить новое ограничение общего бюджета не получится. Если у кампании уже установлен бюджет, можно:\n- Убрать ограничения: передайте `0` в этом параметре.\n- Не менять бюджет кампании. Когда он будет исчерпан, уберите ограничения бюджета или создайте новую кампанию с неограниченным бюджетом.\n"
    },
    "dailyBudget": {
      "type": "string",
      "format": "uint64",
      "description": "Ограничение дневного бюджета рекламной кампании. Единица измерения — одна миллионная доля рубля, округляется до копеек. Например, значение `1 000 000` в параметре равно 1 рублю.\n\nЕсли параметр не заполнен, дневной бюджет не ограничен. После создания рекламной кампании изменить бюджет с дневного на недельный и наоборот не получится.\n",
      "deprecated": true
    },
    "weeklyBudget": {
      "type": "string",
      "format": "uint64",
      "description": "Ограничение недельного бюджета рекламной кампании. Единица измерения — одна миллионная доля рубля, округляется до\nкопеек. Например, значение `1 000 000` в параметре равно 1 рублю.\n\nЕсли параметр не заполнен, недельный бюджет не ограничен. После создания рекламной кампании изменить бюджет с недельного на дневной и наоборот не получится.\n"
    }
  }
}
```

### 3. `ActivateCampaign`

**POST /api/client/campaign/{campaignId}/activate**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_campaign_campaignid_activate`  
Summary: Активировать кампанию  

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64",
      "description": "Идентификатор кампании."
    },
    "description": null
  }
]
```

#### Request body

Body required: **no**

```json
null
```

### 4. `DeactivateCampaign`

**POST /api/client/campaign/{campaignId}/deactivate**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_campaign_campaignid_deactivate`  
Summary: Выключить кампанию  

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64",
      "description": "Идентификатор кампании."
    },
    "description": null
  }
]
```

#### Request body

Body required: **no**

```json
null
```

### 5. `ListCampaignObjects`

**GET /api/client/campaign/{campaignId}/objects**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_campaign_campaignid_objects`  
Summary: Список продвигаемых объектов в кампании  
Description:  Метод для получения списка продвигаемых объектов в кампаниях «Оплата за клик», «Баннеры» и «Видеобаннеры». Чтобы получить товары в кампании «Оплата за заказ», используйте [POST /campaign/search_promo/v2/products](#operation/ExternalCampaign_ListSearchPromoProductsV2).   

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64"
    },
    "description": "Идентификатор кампании."
  }
]
```

#### Request body

None.

### 6. `AddProducts`

**POST /api/client/campaign/{campaignId}/products**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_campaign_campaignid_products`  
Summary: Добавить товары в кампанию  
Description:  В кампанию можно добавить не более 500 товаров. **Рекомендации по заполнению параметров для разных кампаний** - Для добавления в кампанию товаров передайте значения параметров `sku` и `bid`. Если параметр `bid` не указан,    автоматически задаётся конкурентная ставка. - Параметр `bid` учитывается только для кампании с включённой стратегией «Средняя стоимость клика».  - Для кампании с включённой стратегией можно добавлять товары только из категории `autopilot.categoryId`.   

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64",
      "description": "Идентификатор кампании."
    },
    "description": null
  }
]
```

#### Request body

Body required: **no**

```json
null
```

### 7. `UpdateProducts`

**PUT /api/client/campaign/{campaignId}/products**  
Safety: **write**  
MCP operation: `ozonperf_put_api_client_campaign_campaignid_products`  
Summary: Обновить ставки товаров  
Description:  Этот метод перезаписывает список стоп-слов и фразы со ставками. Исходные стоп-слова и фразы со ставками удаляются. Чтобы обновить ставки в кампании с размещением в карточке товара, передайте значения параметров `sku` и `bid`. Параметр `bid` учитывается только для кампании с включённой стратегией «Средняя стоимость клика».   

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64",
      "description": "Идентификатор кампании."
    },
    "description": null
  }
]
```

#### Request body

Body required: **no**

```json
null
```

### 8. `GetProductsCompetitiveBids`

**GET /api/client/campaign/{campaignId}/products/bids/competitive**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_campaign_campaignid_products_bids_co`  
Summary: Конкурентные ставки для товара  
Description:  Если товар не добавлен в кампанию, в параметре `bid` будет значение `0`. В одном запросе вы можете передать до 200 товаров.   

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string"
    },
    "description": "Идентификатор кампании."
  },
  {
    "name": "skus",
    "in": "query",
    "required": false,
    "schema": {
      "type": "array",
      "items": {
        "type": "string"
      }
    },
    "description": "Список SKU товаров."
  }
]
```

#### Request body

None.

### 9. `DeleteProducts`

**POST /api/client/campaign/{campaignId}/products/delete**  
Safety: **destructive**  
MCP operation: `ozonperf_post_api_client_campaign_campaignid_products_delete`  
Summary: Удалить товары из кампании  

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64",
      "description": "Идентификатор кампании."
    },
    "description": null
  }
]
```

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "sku": {
      "type": "array",
      "description": "SKU продвигаемого товара.",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    }
  }
}
```

### 10. `GetProductsV2`

**GET /api/client/campaign/{campaignId}/v2/products**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_campaign_campaignid_products`  
Summary: Список товаров кампании  

#### Path/query parameters

```json
[
  {
    "name": "campaignId",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64"
    },
    "description": "Идентификатор кампании."
  },
  {
    "name": "page",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64"
    },
    "description": "Номер страницы."
  },
  {
    "name": "pageSize",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64"
    },
    "description": "Размер страницы."
  }
]
```

#### Request body

None.

### 11. `ActivateAllSkuPromoCampaign`

**GET /api/client/campaign/all_sku_promo/activate**  
Safety: **write**  
MCP operation: `ozonperf_get_api_client_campaign_all_sku_promo_activate`  
Summary: Включить продвижение в оплате за заказ — все товары  

#### Path/query parameters

None.

#### Request body

None.

### 12. `DeactivateAllSkuPromoCampaign`

**GET /api/client/campaign/all_sku_promo/deactivate**  
Safety: **write**  
MCP operation: `ozonperf_get_api_client_campaign_all_sku_promo_deactivate`  
Summary: Выключить продвижение в оплате за заказ — все товары  

#### Path/query parameters

None.

#### Request body

None.

### 13. `SetAllSkuPromoCampaignBid2`

**GET /api/client/campaign/all_sku_promo/set_bid**  
Safety: **write**  
MCP operation: **MISSING in current 45-operation catalog**  
Summary: Установить ставку для продвижения в Оплате за заказ — все товары  

#### Path/query parameters

```json
[
  {
    "name": "bid",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "uint64",
      "description": "Значение ставки в процентах:\n - `5`,\n - `7`,\n - `9`.\n",
      "default": 7
    },
    "description": null
  }
]
```

#### Request body

None.

### 14. `CreateProductCampaignCPCV2`

**POST /api/client/campaign/cpc/v2/product**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_campaign_cpc_product`  
Summary: Создать кампанию с оплатой за клики  
Description: Метод для создания товарной рекламной кампании с оплатой за клики. При успешном выполнении запроса в поле `campaignId` ответа будет идентификатор созданной кампании.   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 15. `ExternalCampaign_BatchDisableCarrots4`

**POST /api/client/campaign/search_promo/carrots/disable**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_campaign_search_promo_carrots_disab`  
Summary: Отключить продвижение товаров в акции «Морковск»  
Description: Удаляет товары из акции «Морковск».<br> [Подробнее об акции](https://seller-edu.ozon.ru/how-to-sell-effectively/advertising-of-goods/morkovsk)   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 16. `ExternalCampaign_BatchEnableCarrots4`

**POST /api/client/campaign/search_promo/carrots/enable**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_campaign_search_promo_carrots_enabl`  
Summary: Включить продвижение товаров в акции «Морковск»  
Description: Добавляет товары в акцию «Морковск».<br> [Подробнее об акции](https://seller-edu.ozon.ru/how-to-sell-effectively/advertising-of-goods/morkovsk)   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 17. `ExternalCampaign_DeleteSearchPromoBidsV2`

**POST /api/client/campaign/search_promo/v2/bids/delete**  
Safety: **destructive**  
MCP operation: `ozonperf_post_api_client_campaign_search_promo_bids_delete`  
Summary: Удалить товар из продвижения в оплате за заказ  
Description:  В одном запросе можно передать максимум 1000 товаров.   

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "sku": {
      "type": "array",
      "description": "Список идентификаторов товаров.",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    }
  }
}
```

### 18. `ExternalCampaign_SetSearchPromoBidsV2`

**POST /api/client/campaign/search_promo/v2/bids/set**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_campaign_search_promo_bids_set`  
Summary: Установить ставку на товар  
Description:  Если товар ещё не добавлен в продвижение, система добавит его автоматически. В одном запросе можно передать максимум 1000 товаров.   

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "bids": {
      "type": "array",
      "description": "Значения ставок.",
      "items": {
        "type": "object",
        "properties": {
          "bid": {
            "type": "number",
            "format": "double",
            "description": "Ставка за 1 заказ (CPO), единица измерения — процент от цены товара."
          },
          "sku": {
            "type": "string",
            "format": "uint64",
            "description": "Идентификатор товара."
          }
        }
      }
    }
  }
}
```

### 19. `ExternalCampaign_ListSearchPromoProductsV2`

**POST /api/client/campaign/search_promo/v2/products**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_campaign_search_promo_products`  
Summary: Список товаров в продвижении в оплате за заказ  

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "page": {
      "type": "integer",
      "format": "int64",
      "description": "Номер страницы. Пагинация начинается с единицы."
    },
    "pageSize": {
      "type": "integer",
      "format": "int64",
      "description": "Размер страницы."
    }
  }
}
```

### 20. `GetLimitsList`

**GET /api/client/limits/list**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_limits_list`  
Summary: Лимиты ставок для инструментов продвижения  
Description:  Вы можете получить лимиты ставок по инструментам: - Оплата за заказ:   - Минимальная и максимальная ставка для инструмента.   - Минимальные ставки за заказ для некоторых категорий товаров. - Спецразмещение и Оплата за клик:   - Минимальная и максимальная ставка за клик.   - Минимальные ставки за клик для некоторых категорий товаров.   

#### Path/query parameters

None.

#### Request body

None.

### 21. `ExternalCampaign_BidBySKU`

**POST /api/client/min/sku**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_min_sku`  
Summary: Минимальная ставка для товаров по SKU  
Description: Используйте метод, чтобы узнать минимальную ставку для одного или нескольких товаров по SKU.  

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 22. `GetVendorTag`

**GET /api/client/organisation/vendor_tag**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_organisation_vendor_tag`  
Summary: Метка организации для внешних рекламных кампаний  
Description:  Метод возвращает [префикс для метки UTM_CAMPAIGN](https://docs.ozon.ru/performance/analytics/#как-создать-ссылку-с-utm-метками) по идентификатору организации. [Подробнее о ссылках для внешних рекламных кампаний](https://docs.ozon.ru/performance/analytics/)   

#### Path/query parameters

```json
[
  {
    "name": "orgId",
    "in": "query",
    "required": true,
    "schema": {
      "type": "string",
      "format": "uint64",
      "description": "Идентификатор организации."
    },
    "description": null
  }
]
```

#### Request body

None.

### 23. `ExternalCampaign_ListProductsWithBonuses2`

**GET /api/client/products_with_bonuses**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_products_with_bonuses`  
Summary: Список товаров с бонусами  
Description: Возвращает список SKU товаров, на которые начислены бонусы.  За клик на товар в первую очередь тратятся начисленные на него бонусы. Если бонусы кончились, тратится общий бюджет кампании.   

#### Path/query parameters

None.

#### Request body

None.

### 24. `ExternalCampaign_GetProductsRecommendedBids`

**POST /api/client/search_promo/bids/recommendation**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_search_promo_bids_recommendation`  
Summary: Рекомендованные ставки для товаров  
Description:  За один запрос вы можете передать до 200 SKU.   

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "skus": {
      "type": "array",
      "description": "Список идентификаторов товаров.",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    }
  }
}
```

### 25. `ExternalCampaign_GetCPOMinBids`

**POST /api/client/search_promo/get_cpo_min_bids**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_search_promo_get_cpo_min_bids`  
Summary: Получить фиксированные ставки для товаров  
Description:  За один запрос вы можете передать до 200 SKU.   

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "skus": {
      "type": "array",
      "description": "Список идентификаторов товаров.",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    }
  }
}
```

### 26. `ExternalCampaign_BatchDisableProducts`

**POST /api/client/search_promo/product/disable**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_search_promo_product_disable`  
Summary: Отключить продвижение товара в оплате за заказ  
Description:  В одном запросе можно передать максимум 1000 товаров.   

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "skus": {
      "type": "array",
      "description": "Список идентификаторов товаров.",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    }
  }
}
```

### 27. `ExternalCampaign_BatchEnableProducts`

**POST /api/client/search_promo/product/enable**  
Safety: **write**  
MCP operation: `ozonperf_post_api_client_search_promo_product_enable`  
Summary: Включить продвижение товара в оплате за заказ  
Description:  В одном запросе можно передать максимум 1000 товаров.   

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "skus": {
      "type": "array",
      "description": "Список идентификаторов товаров.",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    }
  }
}
```

### 28. `SearchPromoOrdersReportSubmitRequest`

**POST /api/client/statistic/orders/generate**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_statistic_orders_generate`  
Summary: Получить отчёт по заказам в оплате за заказ — выбранные товары  
Description:  В параметрах запроса `from` и `to` укажите промежуток времени. Performance API асинхронный. Поэтому в результате запроса будет не сам отчёт, а уникальный идентификатор отправленного запроса, с помощью которого можно [проверить статус формирования отчёта](#operation/StatisticsCheck) и [скачать отчёт в формате CSV](#operation/DownloadStatistics). Чтобы запросить отчёт в формате JSON, добавьте `/json` в адрес метода: `/api/client/statistic/orders/generate/json`.    Отчёт содержит: - период отчёта; - дату; - ID заказа; - номер заказа; - SKU; - SKU продвигаемого товара; - артикул; - наименование; - источник заказа; - количество; - стоимость, ₽; - ставку, %; - ставку, ₽; - расход, ₽.   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 29. `SearchPromoProductsReportSubmitRequest`

**POST /api/client/statistic/products/generate**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_statistic_products_generate`  
Summary: Получить отчёт по товарам в оплате за заказ — выбранные товары  
Description:  В параметрах запроса `from` и `to` укажите промежуток времени. Performance API асинхронный. Поэтому в результате запроса будет не сам отчёт, а уникальный идентификатор отправленного запроса, с помощью которого можно [проверить статус формирования отчёта](#operation/StatisticsCheck) и [скачать отчёт в формате CSV](#operation/DownloadStatistics). Чтобы запросить отчёт в формате JSON, добавьте `/json` в адрес метода: `/api/client/statistic/products/generate/json`. Отчёт содержит: - период отчёта; - SKU; - артикул; - наименование; - категорию; - продвижение; - цену товара, ₽; - ставку, %; - ставку, ₽; - количество заказов; - сумму заказов, ₽; - расход, ₽; - продажи («Оплата за клик»), ₽; - расход («Оплата за клик»), ₽; - заказы («Оплата за клик»), шт; - в корзину; - ДРР, %; - последнее изменение.   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 30. `SubmitRequest`

**POST /api/client/statistics**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_statistics`  
Summary: Статистика по кампании  
Description:  В запросе укажите временной промежуток с помощью полей `from` и `to` или `dateFrom` и `dateTo`. Если заполнены все четыре поля, в ответе будет статистика по временному промежутку из полей `dateFrom` и `dateTo`. Performance API асинхронный. Поэтому в результате запроса будет не сам отчёт, а уникальный идентификатор отправленного запроса, с помощью которого можно [проверить статус формирования отчёта](#operation/StatisticsCheck) и [скачать отчёт](#operation/DownloadStatistics). Формат отчёта — CSV.  Архивы с примерами отчётов для разных типов кампаний: - [Баннеры и нативные баннеры](https://cdn.ozone.ru/s3/ozon-disk-api/techdoc/performance/api/report-examples/banner_example_1766144809.zip) - [Видеобаннеры](https://cdn.ozone.ru/s3/ozon-disk-api/techdoc/performance/api/report-examples/videobanner_1705412072.zip) - [Оплата за клик](https://cdn.ozone.ru/s3/ozon-disk-api/techdoc/performance/api/report-examples/stencils16-02_1770993970.zip) Чтобы запросить отчёт в формате JSON, добавьте в адрес метода `/json` и отправьте запрос по адресу `/api/client/statistics/json`.   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 31. `StatisticsCheck`

**GET /api/client/statistics/{UUID}**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_uuid`  
Summary: Cтатус отчёта  

#### Path/query parameters

```json
[
  {
    "name": "UUID",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string"
    },
    "description": "Уникальный идентификатор запроса."
  }
]
```

#### Request body

None.

### 32. `GenerateAllSkuPromoOrdersReport`

**GET /api/client/statistics/all_sku_promo/orders/generate**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_all_sku_promo_orders_gene`  
Summary: Получить отчёт по заказам в оплате за заказ — все товары  
Description: В параметрах запроса `timeBounds.from` и `timeBounds.to` укажите промежуток времени. Performance API асинхронный. Поэтому в результате запроса будет не сам отчёт, а уникальный идентификатор отправленного запроса, с помощью которого можно [проверить статус формирования отчёта](#operation/StatisticsCheck) и [скачать отчёт в формате CSV](#operation/DownloadStatistics). Чтобы запросить отчёт в формате JSON, добавьте `/json` в адрес метода: `/api/client/statistics/all_sku_promo/orders/generate/json`. Отчёт содержит: - период отчёта; - дату; - идентификатор заказа; - номер заказа; - SKU; - SKU продвигаемого товара; - артикул; - название товара; - количество; - стоимость, ₽; - стоимость продажи, ₽; - ставку, %; - ставку, ₽; - расход, ₽.   

#### Path/query parameters

```json
[
  {
    "name": "timeBounds.from",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "date-time"
    },
    "description": "Начальная дата периода отчёта в формате RFC 3339."
  },
  {
    "name": "timeBounds.to",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "date-time"
    },
    "description": "Конечная дата периода отчёта в формате RFC 3339."
  }
]
```

#### Request body

None.

### 33. `GenerateAllSkuPromoProductsReport`

**GET /api/client/statistics/all_sku_promo/products/generate**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_all_sku_promo_products_ge`  
Summary: Получить отчёт по товарам в оплате за заказ — все товары  
Description: В параметрах запроса `timeBounds.from` и `timeBounds.to` укажите промежуток времени. Performance API асинхронный. Поэтому в результате запроса будет не сам отчёт, а уникальный идентификатор отправленного запроса, с помощью которого можно [проверить статус формирования отчёта](#operation/StatisticsCheck) и [скачать отчёт в формате CSV](#operation/DownloadStatistics). Чтобы запросить отчёт в формате JSON, добавьте `/json` в адрес метода: `/api/client/statistics/all_sku_promo/products/generate/json`. Отчёт содержит: - дату; - статус продвижения: включено или выключено; - расход, ₽; - продажи из поиска, ₽; - продажи из рекомендаций, ₽; - количество заказов из поиска; - количество заказов из рекомендаций.   

#### Path/query parameters

```json
[
  {
    "name": "timeBounds.from",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "date-time"
    },
    "description": "Начальная дата периода отчёта в формате RFC 3339."
  },
  {
    "name": "timeBounds.to",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "date-time"
    },
    "description": "Конечная дата периода отчёта в формате RFC 3339."
  }
]
```

#### Request body

None.

### 34. `AttributionSubmitRequest`

**POST /api/client/statistics/attribution**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_statistics_attribution`  
Summary: Отчёт по заказам  
Description:  Метод для получения отчёта по заказам на баннеры. В запросе укажите временной промежуток с помощью полей `from` и `to` или `dateFrom` и `dateTo`. Если заполнены все    четыре поля, в ответе будет статистика по временному промежутку из полей `dateFrom` и `dateTo`. Performance API асинхронный. Поэтому в результате запроса будет не сам отчёт, а уникальный идентификатор отправленного запроса, с помощью которого можно [проверить статус формирования отчёта](#operation/StatisticsCheck) и [скачать отчёт](#operation/DownloadStatistics). Формат отчёта — CSV.  Отчёт содержит: - название, - идентификатор кампании, - период отчёта, - SKU, - названия товаров, - количество заказов, - выручка в рублях, - количество заказов модели, - выручка с заказов модели, - тип атрибуции. Чтобы запросить отчёт в формате JSON, добавьте в адрес метода `/json` и отправьте запрос по адресу `/api/client/statistics/attribution/json`.   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 35. `MediaCampaignList`

**GET /api/client/statistics/campaign/media**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_campaign_media`  
Summary: Статистика по медийным кампаниям  
Description:  В запросе укажите временной промежуток с помощью полей `from` и `to` или `dateFrom` и `dateTo`. Если заполнены все четыре поля, в ответе будет статистика по временному промежутку из полей `dateFrom` и `dateTo`. Формат отчёта — CSV.  Чтобы запросить отчёт в формате JSON, добавьте в адрес метода `/json` и отправьте запрос по адресу `/api/client/statistics/campaign/media/json`. Отчёт содержит: - идентификатор кампании, - название кампании, - формат кампании, - статус кампании, - дневной бюджет в рублях, - бюджет в рублях, - расход в рублях, - показы, - клики, - средняя цена 1000 показов в рублях, - отношение числа кликов к числу показов (CTR), - средняя цена клика в рублях, - заказы в штуках, - заказы после просмотра в штуках, - сумма заказов после просмотра, - доля рекламных расходов (ДРР), - сумма заказов, - тип оплаты, - тип бюджета.   

#### Path/query parameters

```json
[
  {
    "name": "campaignIds",
    "in": "query",
    "required": false,
    "schema": {
      "type": "array",
      "description": "Список идентификаторов кампаний, для которых необходимо подготовить отчёт.\n\nЕсли поле заполнено, в отчёте будет статистика только по указанным кампаниям. Если поле пустое, в ответе будет\nстатистика по всем кампаниям в указанном промежутке времени.\n\nНеобязательное поле.\n",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    },
    "description": null
  },
  {
    "name": "from",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "date-time",
      "description": "Начальная дата периода отчёта в формате RFC3339.\n\nНеобязательное поле.\n"
    },
    "description": null
  },
  {
    "name": "to",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "date-time",
      "description": "Конечная дата периода отчёта в формате RFC3339.\n\nНеобязательное поле.\n"
    },
    "description": null
  },
  {
    "name": "dateFrom",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Начальная дата периода отчёта в формате ГГГГ-ММ-ДД. Например: `2019-02-10`.\n\nНеобязательное поле.\n"
    },
    "description": null
  },
  {
    "name": "dateTo",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Начальная дата периода отчёта в формате ГГГГ-ММ-ДД. Например: `2019-02-10`.\n\nНеобязательное поле.\n"
    },
    "description": null
  }
]
```

#### Request body

None.

### 36. `ProductCampaignList`

**GET /api/client/statistics/campaign/product**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_campaign_product`  
Summary: Статистика по кампании Оплата за клик  
Description: <aside class="notice"> Не расходует лимиты Performance API. </aside> В запросе укажите временной промежуток с помощью полей `from` и `to` или `dateFrom` и `dateTo`. Если заполнены все четыре поля, в ответе будет статистика по временному промежутку из полей `dateFrom` и `dateTo`. Формат отчёта — CSV.  Чтобы запросить отчёт в формате JSON, добавьте в адрес метода `/json` и отправьте запрос по адресу `/api/client/statistics/campaign/product/json`. Отчёт содержит: - идентификатор кампании, - название кампании, - тип объекта, - статус кампании, - недельный бюджет в рублях, - бюджет в рублях, - расход в рублях, - показы, - клики, - количество добавлений товара в корзину, - отношение числа кликов к числу показов (CTR), - средняя цена клика в рублях, - заказы в штуках, - заказы в рублях, - доля рекламных расходов (ДРР), - тип продвижения, - места размещения для спецразмещения.   

#### Path/query parameters

```json
[
  {
    "name": "campaignIds",
    "in": "query",
    "required": false,
    "schema": {
      "type": "array",
      "description": "Список идентификаторов кампаний, для которых необходимо подготовить отчёт.\n\nЕсли поле заполнено, в отчёте будет статистика только по указанным кампаниям. Если поле пустое, в ответе будет\nстатистика по всем кампаниям в указанном промежутке времени.\n\nНеобязательное поле.\n",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    },
    "description": null
  },
  {
    "name": "from",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "date-time",
      "description": "Начальная дата периода отчёта в формате RFC3339.\n\nНеобязательное поле.\n"
    },
    "description": null
  },
  {
    "name": "to",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "format": "date-time",
      "description": "Конечная дата периода отчёта в формате RFC3339.\n\nНеобязательное поле.\n"
    },
    "description": null
  },
  {
    "name": "dateFrom",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Начальная дата периода отчёта в формате ГГГГ-ММ-ДД. Например: `2019-02-10`.\n\nНеобязательное поле.\n"
    },
    "description": null
  },
  {
    "name": "dateTo",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Начальная дата периода отчёта в формате ГГГГ-ММ-ДД. Например: `2019-02-10`.\n\nНеобязательное поле.\n"
    },
    "description": null
  }
]
```

#### Request body

None.

### 37. `GetCampaignDailyStats`

**GET /api/client/statistics/daily**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_daily`  
Summary: Дневная статистика по кампаниям  
Description:  Если в запросе не указаны значения полей `dateFrom` и `dateTo`, то в ответе будет статистика за последние 7 дней. Формат отчёта — CSV.  Чтобы запросить отчёт в формате JSON, добавьте в адрес метода `/json` и отправьте запрос по адресу `/api/client/statistics/daily/json`. Отчёт содержит: - идентификатор кампании, - название кампании, - дата, - показы, - клики, - расход в рублях, - заказы в штуках, - заказы в рублях.   

#### Path/query parameters

```json
[
  {
    "name": "campaignIds",
    "in": "query",
    "required": false,
    "schema": {
      "type": "array",
      "description": "Список идентификаторов кампаний, для которых необходимо подготовить отчёт.\n\nЕсли поле заполнено, в отчёте будет статистика только по указанным кампаниям. Если поле пустое, в ответе будет\nстатистика по всем кампаниям в указанном промежутке времени.\n\nНеобязательное поле.\n",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    },
    "description": null
  },
  {
    "name": "dateFrom",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Начальная дата периода отчёта в формате ГГГГ-ММ-ДД. Например: `2019-02-10`.\n\nНеобязательное поле.\n"
    },
    "description": null
  },
  {
    "name": "dateTo",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Начальная дата периода отчёта в формате ГГГГ-ММ-ДД. Например: `2019-02-10`.\n\nНеобязательное поле.\n"
    },
    "description": null
  }
]
```

#### Request body

None.

### 38. `GetCampaignExpense`

**GET /api/client/statistics/expense**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_expense`  
Summary: Статистика по расходу кампаний  
Description:  Если в запросе не указаны значения полей `dateFrom` и `dateTo`, то в ответе будет статистика за последние 7 дней. Формат отчёта — CSV.  Чтобы запросить отчёт в формате JSON, добавьте в адрес метода `/json` и отправьте запрос по адресу `/api/client/statistics/expense/json`. Отчёт содержит: - идентификатор кампании, - дата, - название, - расход, - расход с абонентского счёта, - расход бонусов.   

#### Path/query parameters

```json
[
  {
    "name": "campaignIds",
    "in": "query",
    "required": false,
    "schema": {
      "type": "array",
      "description": "Список идентификаторов кампаний, для которых необходимо подготовить отчёт.\n\nЕсли поле заполнено, в отчёте будет статистика только по указанным кампаниям. Если поле пустое, в ответе будет\nстатистика по всем кампаниям в указанном промежутке времени.\n\nНеобязательное поле.\n",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    },
    "description": null
  },
  {
    "name": "dateFrom",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Начальная дата периода отчёта в формате ГГГГ-ММ-ДД. Например: `2019-02-10`.\n\nНеобязательное поле.\n"
    },
    "description": null
  },
  {
    "name": "dateTo",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Начальная дата периода отчёта в формате ГГГГ-ММ-ДД. Например: `2019-02-10`.\n\nНеобязательное поле.\n"
    },
    "description": null
  }
]
```

#### Request body

None.

### 39. `ListReportsExternal`

**GET /api/client/statistics/externallist**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_externallist`  
Summary: Список отчётов, сгенерированных через API  
Description:  Метод для получения списка отчётов, которые сгенерированы через API сервисными аккаунтами.   

#### Path/query parameters

```json
[
  {
    "name": "page",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64",
      "description": "Номер страницы."
    },
    "description": null
  },
  {
    "name": "pageSize",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64",
      "description": "Размер страницы."
    },
    "description": null
  }
]
```

#### Request body

None.

### 40. `ListReports`

**GET /api/client/statistics/list**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_list`  
Summary: Список отчётов, сгенерированных через интерфейс  
Description:  Метод для получения списка отчётов, которые сгенерированы через интерфейс рекламного кабинета.   

#### Path/query parameters

```json
[
  {
    "name": "page",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64",
      "description": "Номер страницы."
    },
    "description": null
  },
  {
    "name": "pageSize",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64",
      "description": "Размер страницы."
    },
    "description": null
  }
]
```

#### Request body

None.

### 41. `ExternalStatistics_StatisticsPhrasesSubmitRequest2`

**POST /api/client/statistics/phrases**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_statistics_phrases`  
Summary: Отчёт по поисковым запросам  
Description: Метод находится на стадии тестирования.<br><br> Отчёт можно сформировать только для кампаний с оплатой за клик с признаком `placement = PLACEMENT_TOP_PROMOTION`.<br><br> Чтобы запросить отчёт в формате JSON, добавьте в адрес метода `/json` и отправьте запрос по адресу `/api/client/statistics/phrases/json`.  

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 42. `SearchPromoProductsSKUStatistics2`

**POST /api/client/statistics/products/sku**  
Safety: **read**  
MCP operation: **MISSING in current 45-operation catalog**  
Summary: Получить статистику по товарам в оплате за клик  
Description: <aside class="notice"> Не расходует лимиты Performance API. </aside>   

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "campaignIds": {
      "type": "array",
      "description": "Список идентификаторов кампаний.",
      "items": {
        "type": "string",
        "format": "uint64"
      }
    },
    "dateFrom": {
      "type": "string",
      "description": "Дата начала периода статистики, не раньше предыдущего дня."
    },
    "dateTo": {
      "type": "string",
      "description": "Дата окончания периода статистики."
    }
  }
}
```

### 43. `DownloadStatistics`

**GET /api/client/statistics/report**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_statistics_report`  
Summary: Получить отчёты  
Description: При успешном запросе ссылка на скачивание отчёта в формате CSV или ZIP появится в поле `link` при использовании метода [«Статус отчета»](#operation/StatisticsCheck). Формат отчёта в заголовке ответа указан в поле `content-type`. Формат зависит от того, сколько кампаний в поле `campaigns` исходного запроса: - CSV — если в списке одна кампания. - ZIP-архив — если в списке несколько кампаний. Каждый файл соответствует одной кампании из списка. Имя файла вида `<идентификатор кампании>.csv`.   

#### Path/query parameters

```json
[
  {
    "name": "UUID",
    "in": "query",
    "required": false,
    "schema": {
      "type": "string",
      "description": "Уникальный идентификатор запроса."
    },
    "description": null
  }
]
```

#### Request body

None.

### 44. `VideoCampaignsSubmitRequest`

**POST /api/client/statistics/video**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_statistics_video`  
Summary: Статистика по показам видеобаннера  
Description:  В запросе укажите временной промежуток с помощью полей `dateFrom` и `dateTo`. Performance API асинхронный. Поэтому в результате запроса будет не сам отчёт, а уникальный идентификатор отправленного запроса, с помощью которого можно [проверить статус формирования отчёта](#operation/StatisticsCheck) и [скачать отчёт](#operation/DownloadStatistics). Формат отчёта — CSV.  Отчёт содержит: - название; - идентификатор кампании; - период отчёта; - идентификатор баннера; - показы; - клики; - охват; - CTR; - доля видимых показов; - досмотры по квартилям: 25%, 50%, 75% и 100%; - доля досмотров: 25%, 50%, 75% и 100%; - просмотры со звуком; - заказы; - расход. Чтобы запросить отчёт в формате JSON, добавьте в адрес метода `/json` и отправьте запрос по адресу `/api/client/statistics/video/json`.   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 45. `VendorStatisticsSubmitRequest`

**POST /api/client/vendors/statistics**  
Safety: **read**  
MCP operation: `ozonperf_post_api_client_vendors_statistics`  
Summary: Отчёт с аналитикой внешнего трафика  
Description:  Метод для запуска формирования отчёта с аналитикой внешнего трафика. Разница между `dateFrom` и `dateTo` должна быть не больше трёх месяцев. Если разница больше,  отчёт сформируется за 3 месяца с даты, указанной в `dateFrom`.   

#### Path/query parameters

None.

#### Request body

Body required: **no**

```json
null
```

### 46. `VendorStatisticsCheck`

**GET /api/client/vendors/statistics/{UUID}**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_vendors_statistics_uuid`  
Summary: Информация об отчёте по UUID  

#### Path/query parameters

```json
[
  {
    "name": "UUID",
    "in": "path",
    "required": true,
    "schema": {
      "type": "string",
      "description": "Уникальный идентификатор запроса."
    },
    "description": null
  },
  {
    "name": "vendor",
    "in": "query",
    "required": true,
    "schema": {
      "type": "boolean",
      "description": "Признак, что запрашивается отчёт с аналитикой внешнего трафика. Передавайте `true` в этом параметре."
    },
    "description": null
  }
]
```

#### Request body

None.

### 47. `VendorStatisticsListReports`

**GET /api/client/vendors/statistics/list**  
Safety: **read**  
MCP operation: `ozonperf_get_api_client_vendors_statistics_list`  
Summary: Список запрошенных отчётов с аналитикой внешнего трафика  

#### Path/query parameters

```json
[
  {
    "name": "page",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64",
      "description": "Номер страницы."
    },
    "description": null
  },
  {
    "name": "pageSize",
    "in": "query",
    "required": false,
    "schema": {
      "type": "integer",
      "format": "int64",
      "description": "Размер страницы."
    },
    "description": null
  }
]
```

#### Request body

None.

### 48. `CalculateDynamicBudget`

**POST /external/api/dynamic_budget**  
Safety: **write**  
MCP operation: `ozonperf_post_external_api_dynamic_budget`  
Summary: Рассчитать минимальный бюджет кампании  
Description: <aside class="warning"> 1 сентября 2025 года метод будет отключён. Теперь минимальный бюджет рассчитывается по формуле: <b>2&nbsp;000 рублей × 1 SKU</b>. </aside>   

#### Path/query parameters

None.

#### Request body

Body required: **yes**

```json
{
  "type": "object",
  "properties": {
    "createCampaign": {
      "type": "object",
      "title": "object",
      "description": "Параметры для расчёта при создании кампании.",
      "properties": {
        "autopilotStrategy": {
          "type": "string",
          "title": "string",
          "description": "Стратегия, которая будет использоваться для кампании:\n- `MAX_CLICKS` — автостратегия для Поиска и рекомендаций;\n- `TOP_MAX_CLICKS` — автостратегия для Поиска;\n- `TARGET_BIDS` — средняя стоимость клика для Поиска;\n- `NO_AUTO_STRATEGY` — не использовать автостратегию.\n",
          "default": "NO_AUTO_STRATEGY",
          "enum": [
            "MAX_CLICKS",
            "TOP_MAX_CLICKS",
            "TARGET_BIDS",
            "NO_AUTO_STRATEGY"
          ]
        },
        "placement": {
          "type": "string",
          "title": "string",
          "description": "Место размещения рекламы:\n  - `CAMPAIGN_PLACEMENT_INVALID` — не определено;\n  - `CAMPAIGN_PLACEMENT_PDP` — карточка товара;\n  - `CAMPAIGN_PLACEMENT_SEARCH_AND_CATEGORY` — поиск и рекомендации;\n  - `CAMPAIGN_PLACEMENT_TOP_PROMOTION` — поиск;\n  - ~~`CAMPAIGN_PLACEMENT_TAKEOVER`~~ — одновременный показ товаров на первых 4 плитках. Значение устарело.\n",
          "default": "CAMPAIGN_PLACEMENT_INVALID",
          "enum": [
            "CAMPAIGN_PLACEMENT_INVALID",
            "CAMPAIGN_PLACEMENT_PDP",
            "CAMPAIGN_PLACEMENT_SEARCH_AND_CATEGORY",
            "CAMPAIGN_PLACEMENT_TOP_PROMOTION",
            "CAMPAIGN_PLACEMENT_TAKEOVER"
          ]
        },
        "skusCount": {
          "type": "string",
          "format": "uint64",
          "description": "Количество товаров."
        }
      }
    },
    "updateCampaign": {
      "type": "object",
      "title": "object",
      "description": "Параметры для расчёта при обновлении кампании.",
      "properties": {
        "addingSkus": {
          "type": "array",
          "description": "Товары, которые добавили в кампанию.",
          "items": {
            "type": "string",
            "format": "uint64"
          }
        },
        "autopilotStrategy": {
          "type": "object",
          "title": "object",
          "description": "Информация об автостратегии.",
          "properties": {
            "strategy": {
              "type": "string",
              "title": "string",
              "description": "Стратегия, которая будет использоваться для кампании:\n- `MAX_CLICKS` — автостратегия для Поиска и рекомендаций;\n- `TOP_MAX_CLICKS` — автостратегия для Поиска;\n- `TARGET_BIDS` — средняя стоимость клика для Поиска;\n- `NO_AUTO_STRATEGY` — не использовать автостратегию.\n",
              "default": "NO_AUTO_STRATEGY",
              "enum": [
                "MAX_CLICKS",
                "TOP_MAX_CLICKS",
                "TARGET_BIDS",
                "NO_AUTO_STRATEGY"
              ]
            }
          }
        },
        "campaignId": {
          "type": "string",
          "format": "uint64",
          "description": "Идентификатор кампании."
        }
      }
    }
  }
}
```

## Safety corrections recorded in this matrix

1. `POST /api/client/min/sku` — **read**, because the method obtains minimum bids for SKU; POST is transport semantics, not a state change.
2. `POST /api/client/search_promo/bids/recommendation` — **read**, because it obtains recommended bids.
3. `GET /api/client/campaign/all_sku_promo/activate` — **write**, despite GET, because it activates promotion.
4. `GET /api/client/campaign/all_sku_promo/deactivate` — **write**, despite GET, because it deactivates promotion.
5. `GET /api/client/campaign/all_sku_promo/set_bid` — **write**, despite GET, because it sets the promotion bid.
6. `PATCH /api/client/campaign/{campaignId}` — **write**.
7. Delete endpoints are **destructive**.

## Source and reproducibility

- OpenAPI source: `MissiaL/ozon-api` / `references/ozon-performance-openapi.json`.
- OpenAPI blob SHA: `c1d098e0bd9fd6ad8e6ff825b2c8451a531f8d7d`.
- Source URL: https://github.com/MissiaL/ozon-api/blob/main/references/ozon-performance-openapi.json
- Live MCP audit source: `/tmp/ozon-perf-describe-2026-09-26.json`, 45/45 successful `ozon_perf_describe_method` responses.
- Live normalized matrix: `/tmp/ozon-perf-live-matrix.json`.

> Эта документация фиксирует API-контракт и классификацию. Она **не меняет runtime-код** Performance MCP.
