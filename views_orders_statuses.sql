CREATE VIEW ziffapp.views_orders_statuses
(
    `id` UInt8,
    `name` String
)
AS SELECT *
FROM ziffapp.orders_statuses