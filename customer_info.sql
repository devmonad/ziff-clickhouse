CREATE TABLE ziffapp.customer_info
(
    `brand_id` Int8,
    `customer_hash_int` UInt64,
    `fullname_encrypted` String,
    `phone_encrypted` String,
    `updated_at` DateTime
)
ENGINE = ReplacingMergeTree(updated_at)
ORDER BY (customer_hash_int, brand_id)
SETTINGS min_age_to_force_merge_seconds = 30, index_granularity = 8192