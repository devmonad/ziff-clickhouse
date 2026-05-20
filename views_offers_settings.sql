CREATE VIEW ziffapp.views_offers_settings
(
    `id` Int32,
    `guarantee_sub` String
)
AS SELECT *
FROM ziffapp.offers_mysql