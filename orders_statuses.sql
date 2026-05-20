CREATE TABLE ziffapp.orders_statuses
(
    `id` UInt8,
    `name` String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192