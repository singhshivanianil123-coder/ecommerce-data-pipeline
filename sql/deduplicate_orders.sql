CREATE OR REPLACE TABLE stg_orders_dedup AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY order_id
               ORDER BY order_date DESC
           ) rn
    FROM stg_orders
)
WHERE rn = 1;