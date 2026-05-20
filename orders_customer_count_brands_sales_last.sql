CREATE TABLE ziffapp.orders_customer_count_brands_sales_last
(
    `brand_id` Int8,
    `customer_hash_int` UInt64,
    `last_order_date_state` AggregateFunction(max, DateTime)
)
ENGINE = AggregatingMergeTree
ORDER BY (brand_id, customer_hash_int)
SETTINGS index_granularity = 8192