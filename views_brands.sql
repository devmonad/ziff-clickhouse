CREATE VIEW ziffapp.views_brands
(
    `id` UInt8,
    `name` String
)
AS SELECT *
FROM ziffapp.orders_brands