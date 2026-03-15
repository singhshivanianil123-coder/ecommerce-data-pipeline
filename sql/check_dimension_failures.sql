USE DATABASE DE_LAB;
USE SCHEMA ECOM;

SELECT s.*
FROM stg_orders_dedup s
LEFT JOIN dim_customer d
ON s.customer_id = d.customer_id
AND s.order_date >= d.start_date
AND s.order_date < d.end_date
WHERE d.customer_key IS NULL;