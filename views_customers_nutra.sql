CREATE VIEW ziffapp.views_customers_nutra
(
    `customer_hash_int` UInt64,
    `fullname_encrypted` String,
    `phone_encrypted` String,
    `country_code` FixedString(2),
    `brand_id` Int64,
    `orders_confirmed` Int64,
    `orders_shipped` Int64,
    `orders_paid` Int64,
    `orders_cancel` Int64,
    `orders_trash` Int64,
    `orders_returned` Int64,
    `calls_total` Int64,
    `calls_trash` Int64,
    `calls_canceled` Int64,
    `calls_last_datetime` DateTime,
    `last_nutra_order_datedate` DateTime,
    `last_ecom_order_datedate` DateTime
)
AS SELECT DISTINCT
    clcb.customer_hash_int AS customer_hash_int,
    '' AS fullname_encrypted,
    '' AS phone_encrypted,
    clcb.brand_id AS brand_id,
    clcb.country_code AS country_code,
    ocb.confirmed AS orders_confirmed,
    ocb.shipped AS orders_shipped,
    ocb.paid AS orders_paid,
    ocb.canceled AS orders_cancel,
    ocb.trash AS orders_trash,
    ocb.returned AS orders_returned,
    cct.total AS calls_total,
    cct.trash AS calls_trash,
    cct.canceled AS calls_canceled,
    clcb.updated_at AS calls_last_datetime,
    lSalesNutra.last_order_date_state AS last_nutra_order_datedate,
    lSalesEcom.last_order_date_state AS last_ecom_order_datedate
FROM ziffapp.customers_lastcall_brands AS clcb
FINAL
ANY LEFT JOIN ziffapp.customer_order_totals AS ocb ON (ocb.customer_hash_int = clcb.customer_hash_int) AND (ocb.brand_id = clcb.brand_id)
ANY LEFT JOIN
(
    SELECT
        brand_id,
        customer_hash_int,
        total,
        canceled,
        trash
    FROM ziffapp.customers_calls_totals
) AS cct ON (cct.customer_hash_int = clcb.customer_hash_int) AND (cct.brand_id = clcb.brand_id)
ANY LEFT JOIN
(
    SELECT
        customer_hash_int,
        brand_id,
        maxMerge(last_order_date_state) AS last_order_date_state
    FROM ziffapp.orders_customer_count_brands_sales_last
    GROUP BY
        customer_hash_int,
        brand_id
) AS lSalesNutra ON (lSalesNutra.customer_hash_int = clcb.customer_hash_int) AND (lSalesNutra.brand_id = 1)
ANY LEFT JOIN
(
    SELECT
        customer_hash_int,
        brand_id,
        maxMerge(last_order_date_state) AS last_order_date_state
    FROM ziffapp.orders_customer_count_brands_sales_last
    GROUP BY
        customer_hash_int,
        brand_id
) AS lSalesEcom ON (lSalesEcom.customer_hash_int = clcb.customer_hash_int) AND (lSalesEcom.brand_id = 5)
WHERE clcb.brand_id = 1