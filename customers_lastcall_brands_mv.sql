CREATE MATERIALIZED VIEW ziffapp.customers_lastcall_brands_mv TO ziffapp.customers_lastcall_brands
(
    `customer_hash_int` UInt64,
    `brand_id` Int64,
    `country_code` FixedString(2),
    `updated_at` DateTime
)
AS SELECT
    customer_hash_int,
    brand_id,
    country_code,
    max(updated_at) AS updated_at
FROM ziffapp.lists_content
GROUP BY
    customer_hash_int,
    brand_id,
    country_code