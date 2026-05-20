CREATE TABLE ziffapp.products_mysql
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
ENGINE = MySQL('135.181.248.186:3306', 'ziffapp', 'views_products', 'chsync', '[HIDDEN]')