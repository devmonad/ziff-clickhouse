CREATE VIEW ziffapp.views_products
(
    `id` Int32,
    `ttl` Int32,
    `name` String,
    `status` UInt8,
    `brand_id` Int32,
    `country_code` String,
    `type` UInt8,
    `buyout_price` Decimal(10, 2),
    `edited_at` Int64,
    `edited_by` Int32,
    `created_at` Int64,
    `created_at_datetime` DateTime,
    `created_by` Int32
)
AS SELECT *
FROM ziffapp.products_mysql