CREATE TABLE ziffapp.customer_order_totals
(
    `customer_hash_int` UInt64,
    `brand_id` UInt32,
    `total` UInt64,
    `confirmed` UInt64,
    `shipped` UInt64,
    `paid` UInt64,
    `canceled` UInt64,
    `trash` UInt64,
    `returned` UInt64,
    `refunded` UInt64,
    `updated_at` DateTime
)
ENGINE = ReplacingMergeTree(updated_at)
ORDER BY (customer_hash_int, brand_id)
SETTINGS min_age_to_force_merge_seconds = 30, index_granularity = 8192