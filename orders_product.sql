CREATE TABLE ziffapp.orders_product
(
    `order_id` UInt64,
    `quantity` UInt64,
    `product_id` Int64,
    `single_price` Decimal(12, 7),
    `cost_per_item` Decimal(12, 7),
    `cost_per_item_additional` Decimal(12, 7),
    `total_price` Decimal(12, 7),
    `deleted` UInt8 DEFAULT 0,
    `updated_at` DateTime,
    `deleted_at` DateTime DEFAULT toDateTime('2100-01-01 00:00:00')
)
ENGINE = ReplacingMergeTree(updated_at)
ORDER BY (order_id, product_id)
TTL deleted_at
SETTINGS min_age_to_force_merge_seconds = 30, index_granularity = 8192