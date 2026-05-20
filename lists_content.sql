CREATE TABLE ziffapp.lists_content
(
    `id` Int64,
    `list_id` Int64,
    `status` Int8,
    `user_id` Int64,
    `country_code` FixedString(2),
    `brand_id` Int64,
    `created_at` DateTime,
    `updated_at` DateTime DEFAULT now(),
    `phone_encrypted` String,
    `customer_hash` String,
    `customer_hash_int` UInt64 DEFAULT cityHash64(customer_hash),
    `did` Nullable(String),
    `before_status` Nullable(Int64),
    `network_id` Nullable(Int64),
    `status_history_3` Nullable(DateTime),
    `status_history_4` Nullable(DateTime),
    `status_history_30` Nullable(DateTime),
    `status_history_8` Nullable(DateTime),
    `status_history_9` Nullable(DateTime),
    `calls_count` Int8,
    `calls_interval` Int8,
    `calls_min` Int8,
    `status_reason` Nullable(Int8),
    `order_row_id` Nullable(Int64),
    `sub_1` Nullable(String),
    `sub_2` Nullable(String),
    `sub_3` Nullable(String),
    `sub_4` Nullable(String),
    `sub_5` Nullable(String),
    `last_save_datetime` Nullable(DateTime),
    `completed` Int8 DEFAULT 0,
    INDEX bf_customer_hash_int customer_hash_int TYPE bloom_filter(0.01) GRANULARITY 64
)
ENGINE = ReplacingMergeTree(updated_at)
ORDER BY id
SETTINGS min_age_to_force_merge_seconds = 30, index_granularity = 8192