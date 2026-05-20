CREATE TABLE ziffapp.orders_brands
(
    `id` UInt8,
    `name` String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192