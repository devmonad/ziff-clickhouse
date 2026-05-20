CREATE MATERIALIZED VIEW ziffapp.customer_info_mv TO ziffapp.customer_info
(
    `brand_id` Int8,
    `customer_hash_int` UInt64,
    `fullname_encrypted` String,
    `phone_encrypted` String,
    `updated_at` DateTime
)
AS SELECT
    brand_id,
    customer_hash_int,
    fullname_encrypted,
    phone_encrypted,
    now() AS updated_at
FROM ziffapp.orders