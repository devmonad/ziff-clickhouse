CREATE MATERIALIZED VIEW ziffapp.orders_customer_count_brands_sales_last_mv TO ziffapp.orders_customer_count_brands_sales_last
(
    `brand_id` Int8,
    `customer_hash_int` UInt64,
    `last_order_date_state` AggregateFunction(max, DateTime)
)
AS SELECT
    brand_id,
    customer_hash_int,
    maxState(created_at) AS last_order_date_state
FROM ziffapp.orders
WHERE status IN (4, 5, 7)
GROUP BY
    brand_id,
    customer_hash_int