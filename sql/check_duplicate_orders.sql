USE DATABASE DE_LAB;
USE SCHEMA ECOM;

SELECT order_id, COUNT(*) AS duplicate_count
FROM stg_orders
GROUP BY order_id
HAVING COUNT(*) > 1;