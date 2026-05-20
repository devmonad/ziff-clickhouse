CREATE VIEW ziffapp.views_orders_product
(
    `order_id` Int64,
    `quantity` UInt64,
    `product_id` Int64,
    `single_price` Decimal(12, 7),
    `cost_per_item` Decimal(12, 7),
    `cost_per_item_additional` Decimal(12, 7),
    `total_price` Decimal(12, 7),
    `updated_at` DateTime
)
AS SELECT
    op.order_id AS order_id,
    op.quantity AS quantity,
    op.product_id AS product_id,
    op.single_price AS single_price,
    op.cost_per_item AS cost_per_item,
    op.cost_per_item_additional AS cost_per_item_additional,
    op.total_price AS total_price,
    op.updated_at AS updated_at
FROM ziffapp.orders AS o
FINAL
INNER JOIN ziffapp.orders_product AS op ON (op.order_id = o.order_id) AND (op.updated_at >= o.updated_at)