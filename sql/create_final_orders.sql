USE DATABASE DE_LAB;
USE SCHEMA ECOM;
CREATE OR REPLACE TABLE final_orders AS
SELECT
    s.order_id,
    d.customer_key,
    s.order_date,
    s.quantity,
    s.unit_price,
    s.quantity * s.unit_price AS net_amount
FROM stg_orders_dedup s
JOIN dim_customer d
ON s.customer_id = d.customer_id
AND s.order_date >= d.start_date
AND s.order_date < d.end_date;