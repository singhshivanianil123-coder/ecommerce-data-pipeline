CREATE OR REPLACE TABLE stg_orders_dedup AS

WITH watermark AS (
    SELECT last_processed_ts
    FROM pipeline_metadata
    WHERE pipeline_name = 'orders_pipeline'
)

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY order_id
               ORDER BY created_timestamp DESC
           ) rn
    FROM stg_orders
    WHERE created_timestamp >
        (SELECT last_processed_ts FROM watermark)
)
WHERE rn = 1;