CREATE VIEW ziffapp.views_countries
(
    `country_code` FixedString(2)
)
AS SELECT country_code
FROM ziffapp.orders
GROUP BY country_code