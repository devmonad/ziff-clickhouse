CREATE TABLE ziffapp.customers_lastcall_brands
(
    `customer_hash_int` UInt64,
    `brand_id` UInt32,
    `country_code` FixedString(2),
    `updated_at` DateTime
)
ENGINE = ReplacingMergeTree(updated_at)
ORDER BY (customer_hash_int, brand_id)
SETTINGS min_age_to_force_merge_seconds = 30, index_granularity = 8192