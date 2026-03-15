USE DATABASE DE_LAB;
USE SCHEMA ECOM;

SELECT
    (SELECT COUNT(*) FROM stg_orders) AS raw_orders,
    (SELECT COUNT(*) FROM stg_orders_dedup) AS dedup_orders,
    (SELECT COUNT(*) FROM final_orders) AS final_orders,
    (SELECT COUNT(*) FROM fact_orders) AS fact_orders;